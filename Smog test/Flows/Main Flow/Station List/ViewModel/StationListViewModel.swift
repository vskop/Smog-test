//
//  StationListViewModel.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation
import Bond
import ReactiveKit

protocol StationListDelegate: AnyObject {
    func wantsToShowStationDetails(stationId: Int)
}

class StationListViewModel: NSObject, BindingExecutionContextProvider {
    
    public var bindingExecutionContext: ExecutionContext { return .immediateOnMain }
    unowned let delegate: StationListDelegate

    var userRepository: UserRepositoryProtocol
        
    var allStations = Observable<MeasuringStations?>(nil)
    let refreshing = Observable<Bool>(false)
    let error = Observable<Error?>(nil)

    // MARK: - Initialisation
    init(delegate: StationListDelegate, userRepository: UserRepositoryProtocol) {
        self.delegate = delegate
        self.userRepository = userRepository

        super.init()
        bindToRepositoryChanges()
        
    }
    
    // MARK: - Public Methods
    func bindToRepositoryChanges() {
        self.userRepository.allStations.bind(to: self) { (me, value) in
            me.allStations.value = value
        }
    }
    
    func viewDidAppear() {
        fetchAllStations()
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let station = allStations.value?[indexPath.row]
        delegate.wantsToShowStationDetails(stationId: station?.id ?? 14)
    }
    
    private func fetchAllStations() {
        self.refreshing.value = true

        userRepository.getAllStations(success: { stations in
            self.refreshing.value = false
            print("success get Stations = \(String(describing: stations))")
            
        }, fail: { (error) in
            self.refreshing.value = false
            print("failure get Stations \(error.message)")
            self.error.value = error

        })

    }
        
}
