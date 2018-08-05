//
//  Portfolios.swift
//  JsonDecodable
//
//  Created by Victor Lee on 5/8/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

struct Portfolios: Decodable {
    let portfolio: Int
    let type: String
    let expReturns: Float
    let optimisedFor: String
    
    // Swift 4.0 - decode snake_case
//    private enum CodingKeys: String, CodingKey {
//        case expReturns = "exp_returns"
//        case optimisedFor = "optimised_for"
//        case portfolio, type
//    }
    
}
