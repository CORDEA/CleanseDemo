//
// Created by Yoshihiro Tanaka on 2018-12-23.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxSwift
import RxCocoa

class MainStore {
    private let reader: Signal<MainAction>
    private let repository: MainRepository

    init<T: BaseSource>(source: T, repository: MainRepository) where MainAction == T.Element {
        reader = source.reader
        self.repository = repository
    }

    func onResult() -> Observable<MainResult> {
        return reader.asObservable().flatMapFirst { [unowned self] action -> Observable<MainResult> in
            switch action {
            case .initialize:
                return self.repository.getRegions().ifEmpty(default: []).map { regions -> MainResult in
                    .success(regions: regions)
                }.asObservable()
            }
        }
    }
}
