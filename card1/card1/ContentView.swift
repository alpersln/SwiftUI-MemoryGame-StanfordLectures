//
//  ContentView.swift
//  card1
//
//  Created by calatinalper on 5.08.2021.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel: EmojiMemoryGameVM
    var body: some View {
        
        Grid(items: viewModel.cards)  { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(Color.yellow)
            
        
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
            @ViewBuilder
    private func body(for size: CGSize) -> some View {
            if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5)
                    .opacity(0.6)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            
            .cardify(isFaceUp: card.isFaceUp)
            
            
        }
  }

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameVM()
        game.choose(card: game.cards[0])
        return ContentView(viewModel: game)
    }
}
}
