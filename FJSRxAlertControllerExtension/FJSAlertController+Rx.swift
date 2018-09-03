//
//  FJSAlertController+Rx.swift
//  FJSRxAlertControllerExtension
//
//  Created by hf on 2018/09/02.
//  Copyright © 2018年 swift-studying.com. All rights reserved.
//

import FJSAlertControllerExtension
import RxSwift

public extension Reactive where Base: UIViewController {
    public func present(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, buttons: [FJSAlertControllerExtension.AlertButton], animated: Bool, completion: (() -> Void)? = nil) -> Observable<(Int, UIAlertAction)> {
        return Observable.create({ (observer) -> Disposable in
            let newAlertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle, buttons: buttons) { index, selectedAction in
                observer.onNext((index, selectedAction))
                observer.onCompleted()
            }
            self.base.present(newAlertController, animated: animated, completion: completion)
            return Disposables.create()
        })
    }
    
    public func present(title: String?, message: String?, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], animated: Bool, completion: (() -> Void)? = nil) -> Observable<(Int, UIAlertAction)> {
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
