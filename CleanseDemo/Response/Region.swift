//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import Foundation

struct Region: Decodable {
    var dcid: String
    var blockStorage: Bool
    var continent: String
    var country: String
    var ddosProtection: Bool
    var name: String
    var regionCode: String
    var state: String

    enum CodingKeys: String, CodingKey {
        case dcid = "DCID"
        case blockStorage = "block_storage"
        case continent
        case country
        case ddosProtection = "ddos_protection"
        case name
        case regionCode = "regioncode"
        case state
    }
}
