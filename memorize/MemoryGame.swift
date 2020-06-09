//
//  MemoryGame.swift
//  memorize
//
//  Created by Zhan ZHANG on 5/30/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var seenCardIndices: Set<Int> = []
    private(set) var score: Int = 0
    private var firstCardTime: Date? = nil
    private var SecondCardTime: Date? = nil
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter {cards[$0].isFaceUp}.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += calculateScore(start: firstCardTime!, end: Date())
                    
                } else {
                    if (seenCardIndices.contains(chosenIndex) || seenCardIndices.contains(potentialMatchIndex)) {
                        score -= 1
                    }
                self.seenCardIndices.insert(chosenIndex)
                self.seenCardIndices.insert(potentialMatchIndex)
                }
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                firstCardTime = Date()
            }
            self.cards[chosenIndex].isFaceUp = true
        }
        print("Score: \(score)")
    }
    
    private func calculateScore(start startMatchTime: Date, end endMatchTime: Date) -> Int {
        let elapsedSeconds = Int(endMatchTime.timeIntervalSince(startMatchTime))
        return max(10 - elapsedSeconds * 2, 0)
    }
        
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
