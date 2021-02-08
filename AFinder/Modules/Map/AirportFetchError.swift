//
//  AirportFetchError.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation

enum AirportFetchError {
    case None
    case Empty
    case ServerError
    
    var errorMessage: String{
        switch self {
        case .None:
            return ""
        case .Empty:
            return "No airports nearby".localized()
        case .ServerError:
            return "Networking error".localized()
        }
    }
}
