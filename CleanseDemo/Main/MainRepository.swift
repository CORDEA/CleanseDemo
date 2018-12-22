//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cleanse

class MainRepository {
    private let client: APIClient

    init(client: APIClient) {
        self.client = client
    }

    struct Module: Cleanse.Module {
        static func configure(binder: SingletonBinder) {
            binder.bind().sharedInScope().to(factory: MainRepository.init)
        }
    }
}
