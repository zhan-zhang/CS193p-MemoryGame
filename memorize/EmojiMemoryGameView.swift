//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Zhan ZHANG on 5/28/20.
//  Copyright © 2020 Zhan ZHANG. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Spacer()
            TitleView(title: self.viewModel.nameOfGame).padding().layoutPriority(0.5)
            Divider()
            Spacer()
            Grid(viewModel.cards) { card in
                CardView(card: card, startColor: self.viewModel.color).onTapGesture { self.viewModel.choose(card: card) }
                    .padding()

            }
            .padding().layoutPriority(1)
            Divider()
            TitleView(title: "Score: \(self.viewModel.score)").padding()
            Spacer()
            Divider()
            Button("Start New Game", action: startNewGame).padding().layoutPriority(0.5)
        }
    }
    
    func startNewGame() {
        self.viewModel.startRandomNewGame()
    }
    
}

struct TitleView: View {
    var title: String
    
    var body: some View {
        GeometryReader { geometry in
            Text(self.title)//.font(Font.system(size: self.fontSize(for: geometry.size, fontScaleFactor: 0.1)))
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var startColor: Color
    
    var body: some View {
        GeometryReader {geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        let gradient = Gradient(colors: [startColor, .white])

        return ZStack{
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            }
            else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(
                        LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                    )
                }
            }
        }.font(Font.system(size: fontSize(for: size, fontScaleFactor: fontScaleFactor)))
    }
    
    // MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 2
    private let fontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame(with: nil))
    }
}
