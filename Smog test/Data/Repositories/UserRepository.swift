//
//  UserRepository.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation
import Bond

protocol UserRepositoryProtocol {

    var allStations: Observable<MeasuringStations?> { get set }
    func getAllStations(success: @escaping (MeasuringStations?) -> Void, fail: @escaping (SmogError) -> Void)
    func getAirQuality(for stationId: Int, success: @escaping (AirQuality?) -> Void, fail: @escaping (SmogError) -> Void)
}

class UserRepository {
    // MARK: Private properties
    private let requestManager: RequestManager

    var allStations = Observable<[MeasuringStation]?>(nil)
    
    // MARK: Initialisation
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }

}

extension UserRepository: UserRepositoryProtocol {
    
    func getAllStations(success: @escaping (MeasuringStations?) -> Void, fail: @escaping (SmogError) -> Void) {
        requestManager.makeRequest(requestData: UserApi.getAllStations, resultType: MeasuringStations.self, success: { [weak self] measuringStations in
            let sortedStations = measuringStations
                .sorted { ($0.city?.name)! < ($1.city?.name)! }
            self?.allStations.value = sortedStations
            success(sortedStations)
            
        }, fail: { error in
            fail(error)
            
        })
    }
    
    func getAirQuality(for stationId: Int, success: @escaping (AirQuality?) -> Void, fail: @escaping (SmogError) -> Void) {
        requestManager.makeRequest(requestData: UserApi.getAirQuality(stationId: stationId), resultType: AirQuality.self, success: { measuringStations in
            success(measuringStations)
            
        }, fail: { error in
            fail(error)
            
        })
    }
    
    
}
