//
//  StationDetailsViewModel.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation
import Bond
import ReactiveKit

protocol StationDetailsDelegate: AnyObject {
    func wantsToGoBack()
}

class StationDetailsViewModel: NSObject, BindingExecutionContextProvider {
    
    public var bindingExecutionContext: ExecutionContext { return .immediateOnMain }
    unowned let delegate: StationDetailsDelegate

    var userRepository: UserRepositoryProtocol
    
    let stationId: Int
    var airQuality = Observable<AirQuality?>(nil)
    let refreshing = Observable<Bool>(false)
    let error = Observable<Error?>(nil)

    // MARK: - Initialisation
    init(stationId: Int, delegate: StationDetailsDelegate, userRepository: UserRepositoryProtocol) {
        self.stationId = stationId
        self.delegate = delegate
        self.userRepository = userRepository

        super.init()
    }
    
    // MARK: - Public Methods

    func viewDidAppear() {
        fetchAllStations()
    }
    
    private func fetchAllStations() {
        self.refreshing.value = true

        userRepository.getAirQuality(for: stationId, success: { airQuality in
            self.refreshing.value = false
            self.airQuality.value = airQuality
            print("success get AirQuality = \(String(describing: airQuality))")
            
        }, fail: { (error) in
            self.refreshing.value = false
            print("failure get Stations \(error.message)")
            self.error.value = error

        })

    }
        
}
