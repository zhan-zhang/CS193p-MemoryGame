//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Zhan ZHANG on 5/30/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(with: nil)

    static func createMemoryGame(with themeOfGame: ThemeSelection?) -> MemoryGame<String> {
        let theme: Theme = themeOfGame != nil ? themeOfGame!.getTheme() : ThemeSelection.getRandomTheme()
        let emojis = theme.emojis.shuffled()
        return MemoryGame<String>(nameOfGame: theme.themeName, numberOfPairsOfCards: theme.numberOfCards) { pairIndex in emojis[pairIndex] }
    }
    
    // MARK: - Access to the Model
    var nameOfGame: String {
        model.nameOfGame
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func startNewGame(themeOfGame: ThemeSelection?) {
        model = EmojiMemoryGame.createMemoryGame(with: themeOfGame)
    }
}
