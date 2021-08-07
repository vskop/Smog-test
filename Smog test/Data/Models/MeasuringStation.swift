//
//  MeasuringStation.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation

//// MARK: - MeasuringStations
//struct MeasuringStations: Codable {
//    var allStations: [MeasuringStation]
//}

typealias MeasuringStations = [MeasuringStation]

struct MeasuringStation : Codable {
    let id : Int?
    let stationName : String?
    let gegrLat : String?
    let gegrLon : String?
    let city : City?
    let addressStreet : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case stationName = "stationName"
        case gegrLat = "gegrLat"
        case gegrLon = "gegrLon"
        case city = "city"
        case addressStreet = "addressStreet"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        stationName = try values.decodeIfPresent(String.self, forKey: .stationName)
        gegrLat = try values.decodeIfPresent(String.self, forKey: .gegrLat)
        gegrLon = try values.decodeIfPresent(String.self, forKey: .gegrLon)
        city = try values.decodeIfPresent(City.self, forKey: .city)
        addressStreet = try values.decodeIfPresent(String.self, forKey: .addressStreet)
    }

}

struct City : Codable {
    let id : Int?
    let name : String?
    let commune : Commune?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case commune = "commune"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        commune = try values.decodeIfPresent(Commune.self, forKey: .commune)
    }

}

struct Commune : Codable {
    let communeName : String?
    let districtName : String?
    let provinceName : String?

    enum CodingKeys: String, CodingKey {

        case communeName = "communeName"
        case districtName = "districtName"
        case provinceName = "provinceName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        communeName = try values.decodeIfPresent(String.self, forKey: .communeName)
        districtName = try values.decodeIfPresent(String.self, forKey: .districtName)
        provinceName = try values.decodeIfPresent(String.self, forKey: .provinceName)
    }

}
