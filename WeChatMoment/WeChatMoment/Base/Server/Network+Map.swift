//
//  SKNetwork+Map.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import Moya
import RxSwift
import RxCocoa

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    public func mapObject<T: Codable>(_ type: T.Type) -> Single<T> {
        return map { try $0.mapObject(type) }
    }

}

extension ObservableType where E == Response {
    public func mapObject<T: Codable>(_ type: T.Type) -> Observable<T> {
        return map({
            try $0.mapObject(type)
        })
    }
}


public extension Response {
    /// 按照自定义Response的结构进行解析
    public func mapObject<T: Codable>(_ type: T.Type) throws -> T {
        let response = try map(NetWork.Response<T>.self)
        if response.success {
            return response.data
        }
        throw NetWork.Error.status(code: response.code, message: response.message)
    }
}
