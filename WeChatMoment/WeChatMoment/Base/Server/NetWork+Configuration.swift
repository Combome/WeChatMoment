//
//  SKNetWork+Configuration.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import Moya

public let kNetWorkTimeoutInterval: TimeInterval = 10

public extension NetWork {
    
    class Configuration {
        public static var `default`: Configuration = Configuration()
        
        public var taskClosure: (TargetType) -> Task = { $0.task }
        
        public var timeoutInterval: TimeInterval = kNetWorkTimeoutInterval
        
        public var plugins: [PluginType] = []
        
        public init() {}
    }
    
}
