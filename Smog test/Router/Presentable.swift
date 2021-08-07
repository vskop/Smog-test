//
//  Presentable.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
