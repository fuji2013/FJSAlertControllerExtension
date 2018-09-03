//
//  ViewController.swift
//  Example
//
//  Created by hf on 2018/09/01.
//  Copyright © 2018年 swift-studying.com. All rights reserved.
//

import UIKit
import FJSAlertControllerExtension
import FJSRxAlertControllerExtension
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    private let disposeBag = DisposeBag()
    
    @IBAction func tapRxExtension(_ sender: Any) {
        rx.present(title: "title", message: "message", preferredStyle: .alert, buttons: [.cancel("NO"), .default("YES")], animated: true)
            .subscribe(onNext: { [unowned self] index, selectedButton in
                self.textLabel.text = selectedButton.title
            })
            .disposed(by: disposeBag)
    }
    
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
    
    @IBAction func changeBgColor(_ sender: UIBarButtonItem) {
        let greenAction = UIAlertAction(title: "green", style: .default)
        let yellowAction = UIAlertAction(title: "yellow", style: .default)
        let redAction = UIAlertAction(title: "red", style: .default)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)

        let alertController = UIAlertController(title: "change background color", message: "select color", preferredStyle: .actionSheet, actions: [greenAction,yellowAction,redAction, cancelAction]) { (index, _) in
            
            switch index {
            case 0: self.view.backgroundColor = .green
            case 1: self.view.backgroundColor = .yellow
            case 2: self.view.backgroundColor = .red
            default: break
            }
        }

        present(alertController, animated: true)
    }
    
}
