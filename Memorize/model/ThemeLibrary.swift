//
//  ThemeLibrary.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import Foundation

enum ThemeLibrary {

    private static let halloween: ThemeModel = ThemeModel(
        name: "Halloween",
        emojis: ["🎃", "👻", "😈"],
        color: "orange"
    )

    private static let animals: ThemeModel = ThemeModel(
        name: "Animals",
        emojis: ["🐶", "🐱", "🐭", "🐹"],
        color: "green"
    )

    private static let fruits: ThemeModel = ThemeModel(
        name: "Fruits",
        emojis: ["🍎", "🍌", "🍓", "🍇", "🍉"],
        color: "red"
    )

    static let all: [ThemeModel] = [
        halloween,
        animals,
        fruits
    ]
}
