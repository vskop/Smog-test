//
//  UIExecutableAlertAction.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit

final class UIExecutableAlertAction: UIAlertAction {

    private var handler: ((UIAlertAction) -> Swift.Void)?

    static func with(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIExecutableAlertAction {
        let action = UIExecutableAlertAction(title: title, style: style, handler: handler)
        action.handler = handler
        return action
    }

    func execute() {
        handler?(self)
    }

}
