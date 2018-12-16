//
// Created by Yoshihiro Tanaka on 2018-12-16.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxCocoa

class LoginStore {
    private let reader: Signal<LoginAction>

    init<T: BaseSource>(source: T) where LoginAction == T.Element {
        reader = source.reader
    }

    func onResult() -> Signal<LoginResult> {
        return reader.map { action -> LoginResult in
            switch action {
            case .login(key: ""):
                return .failure
            case .login(key: _):
                return .success
            }
        }
    }
}
