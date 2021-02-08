//
//  Airport.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation

struct AirportResponse: Codable {
    var data: [AirportData]
    struct AirportData: Codable {
        
        var name: String
        var iataCode: String?
        var timeZoneOffset: String?
        var geoCode: GeoCode
        
        struct GeoCode: Codable {
            var latitude: Double
            var longitude: Double
        }
    }
}
