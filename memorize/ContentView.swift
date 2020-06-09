//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Zhan ZHANG on 5/28/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
//        let emojiSize =

        return HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture { self.viewModel.choose(card: card)
                }
                .aspectRatio(2/3, contentMode: ContentMode.fit)
            }
        }
            .foregroundColor(Color.orange)
            .padding()
            .font(viewModel.cards.count < 10 ? Font.largeTitle : Font.title)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke()
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
