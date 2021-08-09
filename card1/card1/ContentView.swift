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
                    withAnimation(.linear(duration: 0.80)) {
                    self.viewModel.choose(card: card)
                }
            }
                .padding(5)
            }
            .padding()
            .foregroundColor(Color.yellow)
        Button("New Game") {
            withAnimation(.easeInOut(duration: 2)){
                self.viewModel.resetGame()
            }
        }
            
        
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
            if card.isFaceUp || !card.isMatched {
            ZStack {
                if card.isConsumingBonusTime {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                    .padding(5)
                    .opacity(0.6)
                    .onAppear{
                        self.startBonusTimeAnimation()
                    }
                } else {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                        .padding(5)
                        .opacity(0.6)
                }
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1))
            }
            
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
            
            
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
