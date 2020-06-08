//
//  Array+Only.swift
//  memorize
//
//  Created by Zhan ZHANG on 6/3/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
