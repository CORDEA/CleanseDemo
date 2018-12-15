//
// Created by Yoshihiro Tanaka on 2018-12-15.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cleanse

struct AppComponent: Cleanse.RootComponent {
    typealias Root = PropertyInjector<AppDelegate>
    typealias Scope = Singleton

    static func configure(binder: SingletonBinder) {
        binder.include(module: CoreAppModule.self)
    }

    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.propertyInjector(configuredWith: { bind in
            bind.to(injector: AppDelegate.injectProperties)
        })
    }
}