//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import Cleanse

class LoginNavigator {
    private let window: UIWindow
    private let navigation: TaggedProvider<UINavigationController.Root>

    init(window: UIWindow, navigation: TaggedProvider<UINavigationController.Root>) {
        self.window = window
        self.navigation = navigation
    }

    func navigateToMain() {
        window.rootViewController = navigation.get()
    }
}
