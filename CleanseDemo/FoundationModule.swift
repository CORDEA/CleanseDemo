//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Cleanse
import Foundation

struct FoundationModule: Module {
    static func configure(binder: SingletonBinder) {
        binder.include(module: UserDefaults.Module.self)
    }
}

extension UserDefaults {
    static let apiKeyDefaultsKey = "APIKey"

    struct Module: Cleanse.Module {
        static func configure(binder: SingletonBinder) {
            binder.bind(UserDefaults.self).sharedInScope().to {
                UserDefaults.standard
            }
            binder.bind(String.self).tagged(with: APIKey.self).to { (defaults: UserDefaults) in
                defaults.string(forKey: apiKeyDefaultsKey) ?? ""
            }
        }
    }

    struct APIKey: Tag {
        typealias Element = String
    }
}
