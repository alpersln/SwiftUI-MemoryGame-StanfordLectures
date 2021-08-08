//
//  Cardify.swift
//  card1
//
//  Created by calatinalper on 8.08.2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack{
        if isFaceUp {
            RoundedRectangle(cornerRadius: 15.0).stroke(Color.orange,lineWidth: 9)
            RoundedRectangle(cornerRadius: 15.0).fill(Color.white)
            content
        } else {
            
            RoundedRectangle(cornerRadius: 15.0).fill()
            
         }
    }
}
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
