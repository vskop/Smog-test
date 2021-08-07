//
//  AppDelegate.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        setupAppearance()
        startAppCoordinator()
        
        return true
    }
    
    private func startAppCoordinator() {
        let requestManager = RequestManager(sessionManager: RequestManager.defaultManager)
        let userRepository = UserRepository(requestManager: requestManager)
        appCoordinator = AppCoordinator(requestManager: requestManager, userRepository: userRepository)
        appCoordinator.start()
    }

}

