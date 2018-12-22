//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cleanse
import Alamofire
import Foundation

class APIClient {
    private static let baseUrl: URL = URL(string: "https://api.vultr.com/v1")!
    private let headers: HTTPHeaders

    init(apiKey: TaggedProvider<UserDefaults.APIKey>) {
        self.headers = [
            "API-Key": apiKey.get()
        ]
    }

    func getRegions() -> DataRequest {
        return request(APIClient.baseUrl.appendingPathComponent("/regions/list"), method: .get, headers: headers)
    }

    struct Module: Cleanse.Module {
        static func configure(binder: SingletonBinder) {
            binder.bind().sharedInScope().to(factory: APIClient.init)
        }
    }
}
