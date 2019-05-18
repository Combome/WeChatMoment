//
//  SKUIState.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import RxSwift
import RxCocoa

public enum SKUIState {
    case idle
    case loading
    case success(String?)
    case failure(String?)
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
    
    var isFailure: Bool {
        switch self {
        case .failure:
            return true
        default:
            return false
        }
    }
}

struct SKUIStateToken<E>: Disposable {
    private let _source: Observable<E>
    
    init(source: Observable<E>) {
        _source = source
    }

    func asObservable() -> Observable<E> {
        return _source
    }
    
    func dispose() {
        
    }
    
}

extension ObservableConvertibleType {
    public func trackState( _ relay: PublishRelay<SKUIState>,
                     loading: Bool = true,
                     success:String? = nil,
                     failure: @escaping (Error) -> String? = {$0.errorMessage}) -> Observable<E> {
        return Observable.using({ () -> SKUIStateToken<E> in
            if loading { relay.accept(.loading) }
            return SKUIStateToken(source: self.asObservable())
        }, observableFactory: {
            return $0.asObservable().do(onNext: { _ in
                relay.accept(.success(success))
            }, onError: {
                relay.accept(.failure(failure($0)))
            }, onCompleted: {
                relay.accept(.success(nil))
            })
        })
    }
}
