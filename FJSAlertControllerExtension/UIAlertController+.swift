//
//  UIAlertController+.swift
//  FJSAlertControllerExtension
//
//  Created by hf on 2018/09/01.
//  Copyright © 2018年 swift-studying.com. All rights reserved.
//

import UIKit

public enum AlertButton {
    case cancel(String?)
    case `default`(String?)
    case destructive(String?)
    
    var title: String? {
        switch self {
        case .cancel(let title), .default(let title), .destructive(let title):
            return title
        }
    }
    
    var style: UIAlertActionStyle {
        switch self {
        case .cancel:
            return .cancel
        case .default:
            return .default
        case .destructive:
            return .destructive
        }
    }
}

public extension UIAlertController {
    /**
     return actionHandler with index of selected action and selected action.
     */
    public convenience init(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, buttons: [AlertButton], actionHandler: ((Int, UIAlertAction) -> Void)?) {
        
        let handlerRemovedActions = buttons.enumerated().map { i, button in
            return UIAlertAction(title: button.title, style: button.style) { selectedAction in
                actionHandler?(i, selectedAction)
            }
        }
        self.init(title: title, message: message, preferredStyle: preferredStyle, actions: handlerRemovedActions)
    }
    
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
