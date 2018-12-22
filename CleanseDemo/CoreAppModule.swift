//
// Created by Yoshihiro Tanaka on 2018-12-15.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cleanse

struct CoreAppModule: Cleanse.Module {
    static func configure(binder: SingletonBinder) {
        binder.include(module: FoundationModule.self)
        binder.include(module: UIKitModule.self)
        binder.include(module: LoginViewController.Module.self)
        binder.include(module: MainViewController.Module.self)
    }
}