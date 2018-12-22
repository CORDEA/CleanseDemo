//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import UIKit

class MainTableViewDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
