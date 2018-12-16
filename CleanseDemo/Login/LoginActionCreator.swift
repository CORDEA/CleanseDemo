//
// Created by Yoshihiro Tanaka on 2018-12-16.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

class LoginActionCreator {
    private let action: (LoginAction) -> ()

    init<T: BaseSink>(sink: T) where LoginAction == T.Element {
        action = sink.dispatch
    }

    func login(key: String) {
        action(.login(key: key))
    }
}
