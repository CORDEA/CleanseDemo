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

    @IBOutlet weak var textField: UITextField!

    private let creator: LoginActionCreator
    private let store: LoginStore

    init(creator: LoginActionCreator, store: LoginStore) {
        self.creator = creator
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onClick(_ sender: UIButton) {
    }

    struct Module: Cleanse.Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind().to(factory: LoginDispatcher.init)
            binder.bind().to(factory: { (dispatcher: LoginDispatcher) in
                LoginActionCreator(sink: dispatcher)
            })
            binder.bind().to(factory: { (dispatcher: LoginDispatcher) in
                LoginStore(source: dispatcher)
            })

            binder.bind(LoginViewController.self).to(factory: LoginViewController.init)

            binder.bind().tagged(with: UIViewController.Root.self).to { (root: LoginViewController) in
                root
            }
        }
    }
}
