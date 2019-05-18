//
//  Then.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import RxSwift
import RxCocoa

public extension ObservableType {
    
   public func then(_ closure: @escaping @autoclosure () throws -> Void) -> Observable<E> {
        return map {
            try closure()
            return $0
        }
    }
}

public extension Driver {
    
   public func then(_ closure: @escaping @autoclosure () -> Void) -> SharedSequence<S, E> {
        return map {
            closure()
            return $0
        }
    }
}

