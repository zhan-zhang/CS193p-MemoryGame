//
//  Themes.swift
//  memorize
//
//  Created by Zhan ZHANG on 6/3/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import SwiftUI

struct Theme {
    let themeName: String
    let color: Color
    let emojis: [String]
    let numberOfCards: Int
    
    init(_ themeName: String, with numberOfCards: Int?, using color: Color, from emojis: [String]) {
        let numberOfCards = numberOfCards ?? Int.random(in: 3..<emojis.count)
        self.numberOfCards = numberOfCards
        self.themeName = themeName
        self.color = color
        self.emojis = emojis
    }
}

enum ThemeSelection: CaseIterable {
    
    case Animal, Plant, Transport, Flag, Emotion

    func getTheme() -> Theme {
        switch self {
        case .Animal:
        return Theme("Animal", with: 4, using: Color.yellow, from: ["🐼", "🐸", "🐌", "🦄", "🐥", "🦋"])
        case .Plant:
            return Theme("Plant", with: 4, using: Color.green, from: ["🌵", "🐉", "🎄", "🌲", "🌳", "🌴"])
        case .Flag:
            return Theme("Flag", with: 3, using: Color.red, from: ["🏳️", "🏴‍☠️", "🏁", "🏴", "🏳️‍🌈", "🚩"])
        case .Transport:
            return Theme("Transport", with: 4, using: Color.white, from: ["✈️", "🚀", "🚗", "🚢", "🛰️", "🚴‍♀️"])
        case .Emotion:
            return Theme("Emotion", with: nil, using: Color.black, from: ["😠", "💢", "🥱", "😪", "😢", "😭"])
        }
    }
    
    static func getRandomTheme() -> Theme {
        ThemeSelection.allCases.randomElement()!.getTheme()
    }
}
