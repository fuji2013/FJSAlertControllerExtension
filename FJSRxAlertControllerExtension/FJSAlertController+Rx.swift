//
//  FJSAlertController+Rx.swift
//  FJSRxAlertControllerExtension
//
//  Created by hf on 2018/09/02.
//  Copyright © 2018年 swift-studying.com. All rights reserved.
//

import Foundation
import RxSwift

extension UIViewController {
    func testfunc() -> Observable<Bool> {
        return Observable.just(true)
    }
}
