//
//  SKNetWork+Extension.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import Moya
import RxSwift

extension NetWork {
    /// 如果服务器返回json不为以下结构，要进行更改。
    struct Response<T:Codable>: Codable {
        let code: Int
        let message: String
        let data: T
        
        var success: Bool {
            return code == 200
        }
    }
}

extension NetWork {
    enum Error: SKError {
        case status(code:Int , message:String)
        
        var code: Int {
            switch self {
            case .status(let code,_):
                return code
            }
        }
        
        var message: String {
            switch self {
            case .status(_,let message):
                return message
            }
        }
        
        var errorMessage: String {
            return message
        }
    }
}
