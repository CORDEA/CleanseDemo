//
// Created by Yoshihiro Tanaka on 2018-12-15.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import Cleanse

public struct UIKitModule: Module {
    public static func configure(binder: Binder<Singleton>) {
        binder.include(module: UIScreen.Module.self)
        binder.include(module: UIWindow.Module.self)
    }
}

extension UIScreen {
    public struct Module: Cleanse.Module {
        public static func configure(binder: Binder<Singleton>) {
            binder.bind(UIScreen.self).to {
                UIScreen.main
            }
        }
    }
}

extension UIWindow {
    public struct Module: Cleanse.Module {
        public static func configure(binder: Binder<Singleton>) {
            binder.bind(UIWindow.self).to { (rootViewController: TaggedProvider<UIViewController.Root>, screen: UIScreen) in
                let window = UIWindow(frame: screen.bounds)
                window.rootViewController = rootViewController.get()
                return window
            }
        }
    }
}

extension UIViewController {
    public struct Root: Tag {
        public typealias Element = UIViewController
    }
}