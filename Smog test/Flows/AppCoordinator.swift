//
//  AppCoordinator.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit

class AppCoordinator: Coordinator {
    let router: Router
    private let requestManager: RequestManager
    private var userRepository: UserRepositoryProtocol
    
    init(requestManager: RequestManager, userRepository: UserRepositoryProtocol) {
        router = Router(rootController: AppCoordinator.makeRootViewControllerWithKeyAndVisible())
        self.requestManager = requestManager
        self.userRepository = userRepository
    }
    
    override func start() {
        self.runDefaultFlow()
    }
        
    private func runDefaultFlow() {
        let vm = StationListViewModel(delegate: self, userRepository: userRepository)
        let vc = StationListViewController(viewModel: vm)
        router.setRootModule(vc)
    }
    
    private static func makeRootViewControllerWithKeyAndVisible() -> UINavigationController {
        let rootNavigationController = UINavigationController()
        rootNavigationController.isNavigationBarHidden = false
        
        if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = rootNavigationController
            window?.makeKeyAndVisible()
        }
        
        return rootNavigationController
    }
    
}

extension AppCoordinator: StationListDelegate {
    func wantsToShowStationDetails(stationId: Int) {
        let vm = StationDetailsViewModel(stationId: stationId, delegate: self, userRepository: userRepository)
        let vc = StationDetailsViewController(viewModel: vm)
        router.push(vc, animated: true)
    }
    
}

extension AppCoordinator: StationDetailsDelegate {
    func wantsToGoBack() {
        router.popModule(animated: true)
    }
    
}
