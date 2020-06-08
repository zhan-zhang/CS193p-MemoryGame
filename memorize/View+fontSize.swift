//
//  View+fontSize.swift
//  memorize
//
//  Created by Zhan ZHANG on 6/8/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import SwiftUI

extension View {
    func fontSize(for size: CGSize, fontScaleFactor: CGFloat) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}
