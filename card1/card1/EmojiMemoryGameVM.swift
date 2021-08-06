//
//  EmojiMemoryGameVM.swift
//  card1
//
//  Created by calatinalper on 6.08.2021.
//

import SwiftUI


class EmojiMemoryGameVM: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGameVM.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🦊","💿","🔱"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: -Access to the Model
    
    var cards: Array <MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intents
    
    func choose(card:MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
