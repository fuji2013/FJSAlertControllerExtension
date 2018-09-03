//
//  FJSAlertController+Rx.swift
//  FJSRxAlertControllerExtension
//
//  Created by hf on 2018/09/02.
//  Copyright © 2018年 swift-studying.com. All rights reserved.
//

import FJSAlertControllerExtension
import RxSwift

extension Reactive where Base: UIViewController {
    func present(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], animated: Bool, completion: (() -> Void)? = nil) -> Observable<(Int, UIAlertAction)> {
        return Observable.create({ (observer) -> Disposable in
            let newAlertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle, actions: actions) { index, selectedAction in
                observer.onNext((index, selectedAction))
                observer.onCompleted()
            }
            self.base.present(newAlertController, animated: animated, completion: completion)
            return Disposables.create()
        })
    }
}
