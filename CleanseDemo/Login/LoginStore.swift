//
// Created by Yoshihiro Tanaka on 2018-12-16.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift
import RxCocoa

class LoginStore {
    private let reader: Signal<LoginAction>
    private let userDefaults: UserDefaults

    init<T: BaseSource>(source: T, userDefaults: UserDefaults) where LoginAction == T.Element {
        reader = source.reader
        self.userDefaults = userDefaults
    }

    func onResult() -> Observable<LoginResult> {
        return reader.map { [unowned self] action -> LoginResult in
            switch action {
            case .login(key: ""):
                return .failure
            case .login(key: let key):
                self.userDefaults.set(key, forKey: UserDefaults.apiKeyDefaultsKey)
                return .success
            }
        }.asObservable()
    }
}
