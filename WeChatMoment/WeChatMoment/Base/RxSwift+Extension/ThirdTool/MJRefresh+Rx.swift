//
//  MJRefresh+Rx.swift
//  SK_BasePrivateProject
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019年 max. All rights reserved.
//

import RxCocoa
import RxSwift
import MJRefresh

public extension Reactive where Base: MJRefreshComponent {
    
    public var beginRefreshing: Binder<Void> {
        return Binder(base) { component,_ in
            component.beginRefreshing()
        }
    }
    
    public var refreshing: ControlEvent<Void> {
        return ControlEvent(events: Observable.create({[weak base] (observer) -> Disposable in
            base?.refreshingBlock = {
                observer.onNext(())
            }
            return Disposables.create()
        }))
    }
    
    public var endRefreshing: Binder<Void> {
        return Binder(base) { component, _ in
            component.endRefreshing()
        }
    }
}
