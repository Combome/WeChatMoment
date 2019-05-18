//
//  SKHTTPServices.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//
import Moya
import Result

open class NetWork {
    public static let `default`: NetWork = {
        NetWork(configuration: Configuration.default)
    }()
    
    public let provider: MoyaProvider<MultiTarget>
    
    public init(configuration: Configuration) {
        provider = MoyaProvider(configuration: configuration)
    }
    
}

public extension MoyaProvider {
    convenience init(configuration: NetWork.Configuration) {
        
        self.init(endpointClosure: { (target) -> Endpoint in
            MoyaProvider.defaultEndpointMapping(for: target).replacing(task: configuration.taskClosure(target))
        }, requestClosure: { (endpoint, callback) in
            if var request = try? endpoint.urlRequest() {
                request.timeoutInterval = configuration.timeoutInterval
                callback(.success(request))
            }
        }, plugins: configuration.plugins)
    }
}
