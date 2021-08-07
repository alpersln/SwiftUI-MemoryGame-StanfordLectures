//
//  Array+Only.swift
//  card1
//
//  Created by calatinalper on 7.08.2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
