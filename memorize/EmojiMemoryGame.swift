//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Zhan ZHANG on 5/30/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: GameWithTheme<MemoryGame<String>>
    
    init(with themeOfGame: ThemeSelection?) {
        model = EmojiMemoryGame.createMemoryGame(with: themeOfGame)
    }
    
    func startRandomNewGame() {
        model = EmojiMemoryGame.createMemoryGame(with: nil)
    }
    
    static func createMemoryGame(with themeOfGame: ThemeSelection?) -> GameWithTheme<MemoryGame<String>> {
        let themeOfGame = themeOfGame != nil ? themeOfGame!.getTheme() : ThemeSelection.getRandomTheme()
        let emojis = themeOfGame.emojis.shuffled()
        return
            GameWithTheme(game:
                MemoryGame<String>(numberOfPairsOfCards: themeOfGame.numberOfCards) { pairIndex in emojis[pairIndex] },
                theme: themeOfGame
            )
        }
    
    // MARK: - Access to the Theme
    var nameOfGame: String {
        model.theme.themeName
    }
    
    var color: Color {
        model.theme.color
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.game.cards
    }
    
    var score: Int {
        model.game.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.game.choose(card: card)
    }
}

struct GameWithTheme<Game> {
    var game: Game
    var theme: Theme
}
