//
//  SKNetWork+TargetType.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import UIKit
import Moya

///网络请求结果
public enum SKNetworkResult {
    case success(data: Any, message: String)
    case failed(code: Int, message: String)
}
////网络请求完成回调
public typealias SKNetworkComplete = (_ result: SKNetworkResult)->()

extension TargetType {
    
    ///基于Moya做的网络请求封装
    public func request(_ complete: @escaping SKNetworkComplete) {
        NetWork.default.provider.request(.target(self)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let any = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments)
                    guard let obj = any as? [String: Any] else {
                        complete(SKNetworkResult.failed(code: 101, message: "数据解析错误"))
                        return
                    }
                    let message = "\(obj["message"] ?? "")"
                    let code = obj["code"] as? Int ?? 0
                    let data = obj["data"] as Any
                    if code == 200 {
                        complete(SKNetworkResult.success(data: data, message: message))
                    } else {
                        complete(SKNetworkResult.failed(code: code, message: message))
                    }
                } catch {
                    complete(SKNetworkResult.failed(code: 101, message: "数据接续错误"))
                }
            case .failure(let error):
                complete(SKNetworkResult.failed(code: 101, message: error.localizedDescription))
            }
        }
    }
    
    ///基于Moya做的网络请求封装
    public func upload(_ complete: @escaping SKNetworkComplete) {
        NetWork.default.provider.request(.target(self)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let any = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments)
                    guard let obj = any as? [String: Any] else {
                        complete(SKNetworkResult.failed(code: 101, message: "数据解析错误"))
                        return
                    }
                    let message = "\(obj["statusMessage"] ?? "")"
                    let code = obj["code"] as? Int ?? 0
                    let data = obj["data"] as Any
                    if code == 200 {
                        complete(SKNetworkResult.success(data: data, message: message))
                    } else {
                        complete(SKNetworkResult.failed(code: code, message: message))
                    }
                } catch {
                    complete(SKNetworkResult.failed(code: 101, message: "数据接续错误"))
                }
            case .failure(let error):
                complete(SKNetworkResult.failed(code: 101, message: error.localizedDescription))
            }
        }
    }
}

