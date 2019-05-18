//
//  UIView+Rx.swift
//  RxSwiftX
//
//  Created by Pircate on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import RxSwift
import RxCocoa

public extension Reactive where Base: UIView {
    
    var endEditing: Binder<Bool> {
        return Binder(base) { view, force in
            view.endEditing(force)
        }
    }
    
    var originY: Binder<CGFloat> {
        return Binder(base) { view, y in
            view.frame.origin.y = y
        }
    }
}
