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
    
    @IBAction func tap(_ sender: Any) {
        rx.present(title: "show text", message: "show the text selected button", preferredStyle: .alert,
                   buttons: [.default("OK"), .cancel("CANCEL")], animated: true)
            .subscribe(onNext: { [unowned self] _, selectedButton in
                self.textLabel.text = selectedButton.title
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func changeBgColor(_ sender: UIBarButtonItem) {
        rx.present(title: "select color", message: "change background color", preferredStyle: .actionSheet,
                   buttons: [.default("green"), .default("yellow"), .default("red"), .cancel("cancel")], animated: true)
            .subscribe(onNext: { [unowned self] index, selectedButton in
                switch index {
                case 0: self.view.backgroundColor = .green
                case 1: self.view.backgroundColor = .yellow
                case 2: self.view.backgroundColor = .red
                default: break
                }
            })
            .disposed(by: disposeBag)
    }
}
