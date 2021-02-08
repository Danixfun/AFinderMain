//
//  AirportPin.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation
import MapKit

class AirportPin: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var pinCustomImageName = "airport_placeholder"
    lazy var customPinImage = {
        return scaleImage(imageName: self.pinCustomImageName)
    }()
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
}


class AirportAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
          guard let airport = newValue as? AirportPin else {
            return
          }

          canShowCallout = true
          calloutOffset = CGPoint(x: -5, y: 5)
          rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

          image = airport.customPinImage
        }
      }
}
