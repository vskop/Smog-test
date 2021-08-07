//
//  AirQuality.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation

// MARK: - MeasuringStation
struct AirQuality : Codable {
    let id : Int?
    let stCalcDate : String?
    let stIndexLevel : StIndexLevel?
    let stSourceDataDate : String?
    let so2CalcDate : String?
    let so2IndexLevel : So2IndexLevel?
    let so2SourceDataDate : String?
    let no2CalcDate : String?
    let no2IndexLevel : No2IndexLevel?
    let no2SourceDataDate : String?
    let pm10CalcDate : String?
    let pm10IndexLevel : Pm10IndexLevel?
    let pm10SourceDataDate : String?
    let pm25CalcDate : String?
    let pm25IndexLevel : String?
    let pm25SourceDataDate : String?
    let o3CalcDate : String?
    let o3IndexLevel : O3IndexLevel?
    let o3SourceDataDate : String?
    let stIndexStatus : Bool?
    let stIndexCrParam : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case stCalcDate = "stCalcDate"
        case stIndexLevel = "stIndexLevel"
        case stSourceDataDate = "stSourceDataDate"
        case so2CalcDate = "so2CalcDate"
        case so2IndexLevel = "so2IndexLevel"
        case so2SourceDataDate = "so2SourceDataDate"
        case no2CalcDate = "no2CalcDate"
        case no2IndexLevel = "no2IndexLevel"
        case no2SourceDataDate = "no2SourceDataDate"
        case pm10CalcDate = "pm10CalcDate"
        case pm10IndexLevel = "pm10IndexLevel"
        case pm10SourceDataDate = "pm10SourceDataDate"
        case pm25CalcDate = "pm25CalcDate"
        case pm25IndexLevel = "pm25IndexLevel"
        case pm25SourceDataDate = "pm25SourceDataDate"
        case o3CalcDate = "o3CalcDate"
        case o3IndexLevel = "o3IndexLevel"
        case o3SourceDataDate = "o3SourceDataDate"
        case stIndexStatus = "stIndexStatus"
        case stIndexCrParam = "stIndexCrParam"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        stCalcDate = try values.decodeIfPresent(String.self, forKey: .stCalcDate)
        stIndexLevel = try values.decodeIfPresent(StIndexLevel.self, forKey: .stIndexLevel)
        stSourceDataDate = try values.decodeIfPresent(String.self, forKey: .stSourceDataDate)
        so2CalcDate = try values.decodeIfPresent(String.self, forKey: .so2CalcDate)
        so2IndexLevel = try values.decodeIfPresent(So2IndexLevel.self, forKey: .so2IndexLevel)
        so2SourceDataDate = try values.decodeIfPresent(String.self, forKey: .so2SourceDataDate)
        no2CalcDate = try values.decodeIfPresent(String.self, forKey: .no2CalcDate)
        no2IndexLevel = try values.decodeIfPresent(No2IndexLevel.self, forKey: .no2IndexLevel)
        no2SourceDataDate = try values.decodeIfPresent(String.self, forKey: .no2SourceDataDate)
        pm10CalcDate = try values.decodeIfPresent(String.self, forKey: .pm10CalcDate)
        pm10IndexLevel = try values.decodeIfPresent(Pm10IndexLevel.self, forKey: .pm10IndexLevel)
        pm10SourceDataDate = try values.decodeIfPresent(String.self, forKey: .pm10SourceDataDate)
        pm25CalcDate = try values.decodeIfPresent(String.self, forKey: .pm25CalcDate)
        pm25IndexLevel = try values.decodeIfPresent(String.self, forKey: .pm25IndexLevel)
        pm25SourceDataDate = try values.decodeIfPresent(String.self, forKey: .pm25SourceDataDate)
        o3CalcDate = try values.decodeIfPresent(String.self, forKey: .o3CalcDate)
        o3IndexLevel = try values.decodeIfPresent(O3IndexLevel.self, forKey: .o3IndexLevel)
        o3SourceDataDate = try values.decodeIfPresent(String.self, forKey: .o3SourceDataDate)
        stIndexStatus = try values.decodeIfPresent(Bool.self, forKey: .stIndexStatus)
        stIndexCrParam = try values.decodeIfPresent(String.self, forKey: .stIndexCrParam)
    }

}

struct No2IndexLevel : Codable {
    let id : Int?
    let indexLevelName : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case indexLevelName = "indexLevelName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        indexLevelName = try values.decodeIfPresent(String.self, forKey: .indexLevelName)
    }

}

struct O3IndexLevel : Codable {
    let id : Int?
    let indexLevelName : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case indexLevelName = "indexLevelName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        indexLevelName = try values.decodeIfPresent(String.self, forKey: .indexLevelName)
    }

}

struct Pm10IndexLevel : Codable {
    let id : Int?
    let indexLevelName : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case indexLevelName = "indexLevelName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        indexLevelName = try values.decodeIfPresent(String.self, forKey: .indexLevelName)
    }

}

struct So2IndexLevel : Codable {
    let id : Int?
    let indexLevelName : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case indexLevelName = "indexLevelName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        indexLevelName = try values.decodeIfPresent(String.self, forKey: .indexLevelName)
    }

}

struct StIndexLevel : Codable {
    let id : Int?
    let indexLevelName : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case indexLevelName = "indexLevelName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        indexLevelName = try values.decodeIfPresent(String.self, forKey: .indexLevelName)
    }

}

