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
     return actionHandler with index of selected action and selected action.
     */
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], actionHandler: ((Int, UIAlertAction) -> Void)?) {
        
        let handlerRemovedActions = actions.enumerated().map { i, action in
            return UIAlertAction(title: action.title, style: action.style) { selectedAction in
                actionHandler?(i, selectedAction)
            }
        }
        self.init(title: title, message: message, preferredStyle: preferredStyle, actions: handlerRemovedActions)
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
