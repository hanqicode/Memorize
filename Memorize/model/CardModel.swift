//
//  CardModel.swift
//  Memorize
//
//  Created by Qi Han on 11/9/25.
//

import Foundation

struct CardModel: CustomDebugStringConvertible, Identifiable, Equatable {

    var id: String

    // TODO: Change it to false by default.
    var isFaceUp: Bool = true
    var isMatched: Bool = false
    let content: String

    var debugDescription: String {
        "ID: \(id), CardModel: \(content), isFaceUp: \(isFaceUp), isMatched: \(isMatched)"
    }
}
