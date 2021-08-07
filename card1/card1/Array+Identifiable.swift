//
//  Array+Identifiable.swift
//  card1
//
//  Created by calatinalper on 7.08.2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
