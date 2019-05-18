//
//  Error.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import Foundation

public protocol SKError: Error {
    var errorMessage: String {get}
}

extension Error {
    public var errorMessage: String {
        if let error = self as? SKError {
            return error.errorMessage
        }
        return "未知错误"
    }
    
}
