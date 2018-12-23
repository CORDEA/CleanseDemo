//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

class MainActionCreator {
    private let action: (MainAction) -> ()

    init<T: BaseSink>(sink: T) where MainAction == T.Element {
        action = sink.dispatch
    }

    func initialize() {
        action(.initialize)
    }
}
