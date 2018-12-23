//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift
import RxCocoa

class MainDispatcher: BaseDispatcher {
    typealias Element = MainAction

    private let _reader = PublishRelay<MainAction>()
    lazy var reader: Signal<MainAction> = _reader.asSignal()

    func dispatch(action: MainAction) {
        _reader.accept(action)
    }
}
