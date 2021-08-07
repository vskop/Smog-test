//
//  Configuration.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

//https://powietrze.gios.gov.pl/pjp/content/api

import Foundation

class Configuration {
    // MARK: API
    static let userApiEndpoint = "https://api.gios.gov.pl/pjp-api/rest"
}

class Constants {
    static let timeoutIntervalForResourcesInSeconds = TimeInterval(60) // 1min
}

enum APIPaths: String {
    case allStations = "/station/findAll"
    case airQuality = "/aqindex/getIndex"
}
