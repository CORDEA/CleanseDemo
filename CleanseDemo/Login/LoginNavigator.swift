//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import Cleanse

class LoginNavigator {
    private let _navigationController: Provider<UINavigationController>
    private lazy var navigationController: UINavigationController = _navigationController.get()
    private let viewController: TaggedProvider<UIViewController.Main>

    init(navigationController: Provider<UINavigationController>, viewController: TaggedProvider<UIViewController.Main>) {
        _navigationController = navigationController
        self.viewController = viewController
    }

    func navigateToMain() {
        navigationController.pushViewController(viewController.get(), animated: true)
    }
}
