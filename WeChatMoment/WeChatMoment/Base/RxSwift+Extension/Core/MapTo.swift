//
//  MapTo.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import RxSwift
import RxCocoa

public extension ObservableType {
    
    func map<T>(to transform: @escaping @autoclosure () throws -> T) -> Observable<T> {
        return map { _ in try transform() }
    }
    
    func flatMap<T>(to transform: @escaping @autoclosure () throws -> Observable<T>) -> Observable<T> {
        return flatMap { _ in try transform() }
    }
}

public extension Driver {
    
    func map<T>(to transform: @escaping @autoclosure () -> T) -> SharedSequence<S, T> {
        return map { _ in transform() }
    }
    
    func flatMap<T>(to transform: @escaping @autoclosure () -> SharedSequence<S, T>) -> SharedSequence<S, T> {
        return flatMap { _ in transform() }
    }
}
