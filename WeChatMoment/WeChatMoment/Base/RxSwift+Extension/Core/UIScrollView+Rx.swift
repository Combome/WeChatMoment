//
//  UIScrollView+Rx.swift
//  RxSwiftX
//
//  Created by Pircate on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import RxSwift
import RxCocoa

public extension Reactive where Base: UIScrollView {
    
    var bounces: Binder<Bool> {
        return Binder(base) { scrollView, bounces in
            scrollView.bounces = bounces
        }
    }
}
