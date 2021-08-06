//
//  card1App.swift
//  card1
//
//  Created by calatinalper on 5.08.2021.
//

import SwiftUI

@main
struct card1App: App {
    let game = EmojiMemoryGameVM()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
