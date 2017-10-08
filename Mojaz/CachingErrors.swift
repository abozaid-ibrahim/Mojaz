//
//  CachingErrors.swift
//  Mojaz
//
//  Created by abuzeid ibarhim on 10/2/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import Foundation
enum CachingErrors: Error {
    case invalidFileName
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
