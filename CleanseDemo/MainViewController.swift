//
// Created by Yoshihiro Tanaka on 2018-12-16.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import RxSwift
import Cleanse

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let dataSource: MainTableViewDataSource
    private let creator: MainActionCreator
    private let store: MainStore
    private let disposeBag = DisposeBag()

    init(dataSource: MainTableViewDataSource, creator: MainActionCreator, store: MainStore) {
        self.dataSource = dataSource
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

        tableView.dataSource = dataSource
    }

    struct Module: Cleanse.Module {
        static func configure(binder: SingletonBinder) {
            binder.include(module: MainTableViewDataSource.Module.self)

            binder.bind()
                    .sharedInScope()
                    .to(factory: MainDispatcher.init)
            binder.bind().to(factory: { (dispatcher: MainDispatcher) in
                MainActionCreator(sink: dispatcher)
            })
            binder.bind().to(factory: { (dispatcher: MainDispatcher, repository: MainRepository) in
                MainStore(source: dispatcher, repository: repository)
            })

            binder.bind().to(factory: MainViewController.init)
            binder.bind().tagged(with: UINavigationController.Root.self).to { (root: MainViewController) in
                UINavigationController(rootViewController: root)
            }
        }
    }
}

extension UINavigationController {
    struct Root: Cleanse.Tag {
        typealias Element = UINavigationController
    }
}
