//
// Created by Yoshihiro Tanaka on 2018-12-16.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import Cleanse

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let dataSource: MainTableViewDataSource

    init(dataSource: MainTableViewDataSource) {
        self.dataSource = dataSource
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
        static func configure(binder: Binder<Unscoped>) {
            binder.include(module: MainTableViewDataSource.Module.self)

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
