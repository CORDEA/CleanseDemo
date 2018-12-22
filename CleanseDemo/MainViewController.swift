//
// Created by Yoshihiro Tanaka on 2018-12-16.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import Cleanse

class MainViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    struct Module: Cleanse.Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind().to(factory: MainViewController.init)
            binder.bind().tagged(with: UIViewController.Main.self).to { (root: MainViewController) in
                root
            }
        }
    }
}

extension UIViewController {
    struct Main: Cleanse.Tag {
        typealias Element = UIViewController
    }
}
