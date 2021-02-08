//
//  LocationHelper.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation
import CoreLocation

/// This function help us to quickly know if the app has access to the GPS
func isLocationServiceEnabled()->Bool{
    if CLLocationManager.locationServicesEnabled() {
        switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                return false
            case .authorizedAlways, .authorizedWhenInUse:
                return true
            @unknown default:
                break
        }
    }
    return false
}
