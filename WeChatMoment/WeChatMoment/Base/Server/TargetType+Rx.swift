//
//  TargetType+Rx.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//
import RxSwift
import Moya
import Alamofire



extension TargetType {
    public func request() -> Single<Response> {
        return NetWork.default.provider.rx.request(.target(self))
    }
    
    
}


