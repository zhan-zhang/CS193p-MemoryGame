//
//  Array+Identifiable.swift
//  memorize
//
//  Created by Zhan ZHANG on 6/3/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
