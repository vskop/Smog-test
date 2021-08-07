//
//  AppDelegate+AppAppearance.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation
import SVProgressHUD

extension AppDelegate {

    func setupAppearance() {
        setupNavigationAppearance()
        setupProgressHUDAppearance()
    }

    private func setupNavigationAppearance() {
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
    }

    private func setupProgressHUDAppearance() {
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setBackgroundColor(.clear)
        SVProgressHUD.setRingThickness(4.0)
        SVProgressHUD.setDefaultMaskType(.clear)
    }
}
