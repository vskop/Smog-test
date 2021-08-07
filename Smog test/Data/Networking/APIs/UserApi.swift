//
//  UserApi.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation
import Alamofire

enum UserApi: URLRequestConvertible {
    
    case getAllStations
    case getAirQuality(stationId: Int)

    var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        return encoder
    }
    
    var method: HTTPMethod {
        switch self {
            
        case .getAllStations, .getAirQuality:
            return .get

        }
    }
    
    var path: String {
        switch self {
        case .getAllStations:
            return APIPaths.allStations.rawValue
        
        case .getAirQuality(stationId: let stationId):
            return APIPaths.airQuality.rawValue + "/\(stationId)"

        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = Configuration.userApiEndpoint + path
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
            
        case .getAllStations:
            return urlRequest
            
        case .getAirQuality:
            return urlRequest
        }
    }
        
}
