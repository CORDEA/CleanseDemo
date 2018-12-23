//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit
import Cleanse

class MainTableViewDataSource: NSObject, UITableViewDataSource {

    private var items: [Region] = []

    func refreshItems(items: [Region]) {
        self.items = items
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = item.country
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    struct Module: Cleanse.Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind().to(factory: MainTableViewDataSource.init)
        }
    }
}
