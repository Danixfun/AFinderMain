//
//  MapView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

// Radius free icon by FreePik from flaticons.com
// Clipboard (AKA list) icon By dmitri13 from flaticons.com
// Airport pin by DinosoftLabs from flaticons.com


import Foundation
import UIKit
import MapKit

class MapView: UIViewController {

    // MARK: Properties
    var presenter: MapPresenterProtocol?
    var airports: AirportResponse?
    
    // MARK: IBOutlet
    @IBOutlet weak var mapContainer: MKMapView!
    @IBOutlet weak var noGPSContainer: UIView!
    @IBOutlet weak var noWiFiContainer: UIView!
    @IBOutlet weak var cantFindYouLabel: UILabel!
    @IBOutlet weak var cantFindYouInstructionsLabel: UILabel!
    @IBOutlet weak var openSettingsButton: AFPrimaryButton!
    @IBOutlet weak var connectionLostLabel: UILabel!
    @IBOutlet weak var connectionLostAnimationContainer: UIView!
    @IBOutlet weak var refreshButton: AFSecondaryButton!
    @IBOutlet weak var appSettingsButton: AFSecondaryCircularButton!
    @IBOutlet weak var listButton: AFPrimaryCircularButton!
    @IBOutlet weak var hintContainer: UIView!
    @IBOutlet weak var hintLabel: UILabel!
    
    
    // MARK: IBAction
    @IBAction func openDeviceSettingsAction(_ sender: Any) {
        self.presenter?.openDeviceSettingsAction()
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        self.presenter?.refreshAction()
    }
    
    @IBAction func appSettingsButtonAction(_ sender: Any) {
        self.presenter?.openAppSettings()
    }
    
    @IBAction func listButtonAction(_ sender: Any) {
        self.presenter?.listButtonAction(airports: self.airports)
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
}

extension MapView: MapViewProtocol {
    
    func setUpButtons() {
        self.listButton.setQuick(icon: "clipboard")
        self.appSettingsButton.setQuick(icon: "radius")
    }
    
    func setUpNoGPSContainer() {
        cantFindYouLabel.text = "CantFindYouLabel".localized()
        cantFindYouInstructionsLabel.text = "CantFindYouInstructionsLabel".localized()
        openSettingsButton.setQuick(title: "Open settings")
        noGPSContainer.isHidden = true
        self.view.addSubview(noGPSContainer)
        self.noGPSContainer.center = self.view.center
        setUpButtons()
    }
    
    func setUpMap() {
        mapContainer.delegate = self
        mapContainer.register(
          AirportAnnotationView.self,
          forAnnotationViewWithReuseIdentifier:
            MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    func setUpHints(){
        hintLabel.text = "Searching...".localized()
        hintContainer.layer.cornerRadius = 8.0
        hintContainer.layer.masksToBounds = true
    }
    
    func setUpNoWiFiContainer() {
        connectionLostLabel.text = "ConnectionLostLabel".localized()
        refreshButton.setQuick(title: "Refresh")
        noWiFiContainer.isHidden = true
        AnimationWrapper.setUpAnimation(in: connectionLostAnimationContainer, withFile: "connection_lost")
        self.view.addSubview(noWiFiContainer)
        self.noWiFiContainer.center = self.view.center
    }
    
    func updateHintWithSearchResult(searchResultHint: String){
        DispatchQueue.main.async {
            self.hintLabel.text = searchResultHint
        }
    }
    
    func updateHintWith(hint: String){
        DispatchQueue.main.async {
            self.hintLabel.text = hint
        }
    }
    
    // Center the user based on its location and fetch airports
    func centerMapWith(location: CLLocation, range: Int) {
        mapContainer.centerToLocation(location, regionRadius: CLLocationDistance(range))
    }
    
    // Populate the map with airports
    func foundAirports(airports: AirportResponse) {
        // Remove all current annotations
        DispatchQueue.main.async {
            self.mapContainer.removeAnnotations(self.mapContainer.annotations)
        }
        
        // Add new annotations
        self.airports = airports
        for a in airports.data {
            let newAirportPin = AirportPin(
                title: a.name,
                coordinate: CLLocationCoordinate2D(latitude: a.geoCode.latitude, longitude: a.geoCode.longitude))
            DispatchQueue.main.async {
                self.mapContainer.addAnnotation(newAirportPin)
            }
        }
    }
    
    // No airports near by: Tell the user to make the range wider
    func emptyAirports() {
        DispatchQueue.main.async {
            self.mapContainer.removeAnnotations(self.mapContainer.annotations)
        }
        self.airports = nil
    }

    // Show no connection message
    func errorLoadingAirports() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.mapContainer.isHidden = true
            self.noGPSContainer.isHidden = true
            self.listButton.isHidden = true
            self.appSettingsButton.isHidden = true
            self.hintContainer.isHidden = true
            self.noWiFiContainer.isHidden = false
        })
    }

    func deniedMap() {
        DispatchQueue.main.async {
            self.mapContainer.isHidden = true
            self.noWiFiContainer.isHidden = true
            self.listButton.isHidden = true
            self.appSettingsButton.isHidden = true
            self.hintContainer.isHidden = true
            self.noGPSContainer.isHidden = false
        }
    }
    
    func grantMap() {
        DispatchQueue.main.async {
            self.noGPSContainer.isHidden = true
            self.noWiFiContainer.isHidden = true
            self.listButton.isHidden = false
            self.appSettingsButton.isHidden = false
            self.mapContainer.isHidden = false
            self.hintContainer.isHidden = false
        }
    }
    
}


// MARK: - MKMapViewDelegate
extension MapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? AirportPin else {
            return nil
        }
        let identifier = "Something"
        var view: AirportAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView (
            withIdentifier: identifier) as? AirportAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        }
        else {
            view = AirportAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.image = annotation.customPinImage
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        return view
    }
}

// MARK: - MapKitHelper
private extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1) {
        let radius = regionRadius * 1000// 1000 meters in 1 kilometer
        let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: radius,
        longitudinalMeters: radius)

        setRegion(coordinateRegion, animated: true)
    }
}



