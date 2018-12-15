//
// Created by Yoshihiro Tanaka on 2018-12-15.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cleanse

struct AppComponent: Cleanse.RootComponent {
    typealias Root = PropertyInjector<AppDelegate>

    static func configure(binder: Binder<Unscoped>) {
    }

    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.propertyInjector(configuredWith: { bind in
            bind.to(injector: AppDelegate.injectProperties)
        })
    }
}