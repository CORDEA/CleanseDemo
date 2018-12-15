//
// Created by Yoshihiro Tanaka on 2018-12-15.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift
import RxCocoa

protocol BaseDispatcher: BaseSource, BaseSink {
}

protocol BaseSource: BaseElement {
    var reader: Signal<Element> { get }
}

protocol BaseSink: BaseElement {
    func dispatch(action: Element)
}

protocol BaseElement {
    associatedtype Element
}