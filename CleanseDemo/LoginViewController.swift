//
//  LoginViewController.swift
//  CleanseDemo
//
//  Created by Yoshihiro Tanaka on 2018-12-15.
//  Copyright © 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import RxSwift
import Cleanse

class LoginViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    private let creator: LoginActionCreator
    private let store: LoginStore
    private let disposeBag = DisposeBag()

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
        store.onResult()
                .subscribe(onNext: render)
                .disposed(by: disposeBag)
    }

    @IBAction func onClick(_ sender: UIButton) {
        creator.login(key: textField.text ?? "")
    }

    private func render(result: LoginResult) {
    }

    struct Module: Cleanse.Module {
        // TODO: Should use the view controller scope.
        static func configure(binder: SingletonBinder) {
            binder.bind()
                    .sharedInScope()
                    .to(factory: LoginDispatcher.init)
            binder.bind().to(factory: { (dispatcher: LoginDispatcher) in
                LoginActionCreator(sink: dispatcher)
            })
            binder.bind().to(factory: { (dispatcher: LoginDispatcher) in
                LoginStore(source: dispatcher)
            })

            binder.bind().to(factory: LoginViewController.init)
            binder.bind().tagged(with: UIViewController.Root.self).to { (root: LoginViewController) in
                root
            }
        }
    }
}
