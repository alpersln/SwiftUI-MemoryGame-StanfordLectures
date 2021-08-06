//
//  ContentView.swift
//  card1
//
//  Created by calatinalper on 5.08.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: false)
            }
            .padding()
            .foregroundColor(Color.yellow)
            .font(.largeTitle)
        }
        
    }
}

struct CardView: View {
    var isFaceUp : Bool
    var body: some View {
    ZStack {
        if isFaceUp {
        RoundedRectangle(cornerRadius: 15.0).stroke()
        RoundedRectangle(cornerRadius: 15.0).fill(Color.green)
    Text("👻")
        } else {
            RoundedRectangle(cornerRadius: 15.0).fill()
        }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
