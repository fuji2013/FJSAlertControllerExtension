//
//  ViewController.swift
//  Example
//
//  Created by hf on 2018/09/01.
//  Copyright © 2018年 swift-studying.com. All rights reserved.
//

import UIKit
import FJSAlertControllerExtension

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!

    @IBAction func tap(_ sender: Any) {
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) {
            self.textLabel.text = $0.title
        }
        let okAction = UIAlertAction(title: "ok", style: .default) {
            self.textLabel.text = $0.title
        }
        let alertController = UIAlertController(title: "Alert title", message: "Alert message", preferredStyle: .alert, actions: [cancelAction, okAction])
        
        present(alertController, animated: true)
    }
}
