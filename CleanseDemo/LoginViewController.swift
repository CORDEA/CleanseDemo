//
//  LoginViewController.swift
//  CleanseDemo
//
//  Created by Yoshihiro Tanaka on 2018-12-15.
//  Copyright © 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import Cleanse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    struct Module: Cleanse.Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind(LoginViewController.self).to(factory: LoginViewController.init)

            binder.bind().tagged(with: UIViewController.Root.self).to { (root: LoginViewController) in
                root
            }
        }
    }
}
