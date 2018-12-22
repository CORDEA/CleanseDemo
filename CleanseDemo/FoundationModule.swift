//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cleanse
import Foundation

struct FoundationModule: Module {
    static func configure(binder: SingletonBinder) {
        binder.include(module: UserDefaults.Module.self)
    }
}

extension UserDefaults {
    struct Module: Cleanse.Module {
        static func configure(binder: SingletonBinder) {
        }
    }
}
