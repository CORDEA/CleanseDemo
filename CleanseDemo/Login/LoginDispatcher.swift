//
// Created by Yoshihiro Tanaka on 2018-12-16.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift
import RxCocoa

class LoginDispatcher: BaseDispatcher {
    typealias Element = LoginAction

    private let _reader = PublishSubject<LoginAction>()
    var reader: Observable<LoginAction> {
        return _reader.asObservable()()
    }

    func dispatch(action: LoginAction) {
        _reader.onNext(action)
    }
}
