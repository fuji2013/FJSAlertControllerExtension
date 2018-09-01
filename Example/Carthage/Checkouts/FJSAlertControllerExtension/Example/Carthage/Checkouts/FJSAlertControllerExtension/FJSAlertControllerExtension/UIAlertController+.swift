//
//  UIAlertController+.swift
//  FJSAlertControllerExtension
//
//  Created by hf on 2018/09/01.
//  Copyright © 2018年 swift-studying.com. All rights reserved.
//

import UIKit

public extension UIAlertController {
    /**
     convenience initializer. can add actions when initialize
    */
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction]) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        self.addActions(actions)
    }
    
    /**
     add multiple actions.
     */
    public func addActions(_ actions: [UIAlertAction]) {
        for action in actions {
            addAction(action)
        }
    }
}
