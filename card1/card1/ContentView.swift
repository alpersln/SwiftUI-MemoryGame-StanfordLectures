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
            ZStack {
            if card.isFaceUp {
            RoundedRectangle(cornerRadius: 15.0).stroke()
            RoundedRectangle(cornerRadius: 15.0).fill(Color.green)
                Text(card.content)
            } else {
                if !card.isMatched {
                RoundedRectangle(cornerRadius: 15.0).fill()
                }
             }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
        }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGameVM())
    }
}
