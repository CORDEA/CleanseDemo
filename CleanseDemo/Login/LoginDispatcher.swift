//
// Created by Yoshihiro Tanaka on 2018-12-16.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift
import RxCocoa

class LoginDispatcher: BaseDispatcher {
    typealias Element = LoginAction

    private let _reader = PublishRelay<LoginAction>()
    var reader: Signal<LoginAction> {
        return _reader.asSignal()
    }

    func dispatch(action: LoginAction) {
        _reader.accept(action)
    }
}
