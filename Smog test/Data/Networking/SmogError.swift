//
//  SmogError.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation

enum SmogError: String, Error {
    
    case dataParsingFailed
    case noResponseData
    case unknownBackendError
    case unknownBackendErrorJson
    case noInternetConnection
    case timeout
    
    var title: String {
        switch self {
        case .noInternetConnection:
            return "No internet connection"
            
        default:
            return "Something went wrong"
        }
    }
    
    var message: String {
        switch self {
            
        case .dataParsingFailed:
            return "Data Parsing Failed"
        case .noResponseData:
            return "Data Response missing"
        case .unknownBackendError:
            return "Unknown backend error"
        case .unknownBackendErrorJson:
            return "Unknown backend error json"
        case .noInternetConnection:
            return "Please check your internet connection"
        case .timeout:
            return "Request timed out, try again later"
        }
        
    }
}
