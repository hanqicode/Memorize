//
//  CardModel.swift
//  Memorize
//
//  Created by Qi Han on 11/9/25.
//

import Foundation

struct CardModel: CustomDebugStringConvertible, Identifiable {

    var id: String

    var isFaceUp: Bool = false
    var isMatched: Bool = false
    let content: String

    var debugDescription: String {
        "ID: \(id), CardModel: \(content), isFaceUp: \(isFaceUp), isMatched: \(isMatched)"
    }
}
