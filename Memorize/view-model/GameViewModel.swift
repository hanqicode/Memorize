//
//  GameViewModel.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import SwiftUI

class GameViewModel {

    private var gameModel: GameModel
    private let currentThemeModel: ThemeModel
    private let allThemeModels: [ThemeModel]

    init() {
        allThemeModels = ThemeLibrary.all
//        currentThemeModel = allThemeModels.randomElement()!
        currentThemeModel = allThemeModels[0]
        gameModel = GameModel(themeModel: currentThemeModel)
    }

    func getCards() -> [CardModel] {
        gameModel.cards
    }

    func getThemeName() -> String {
        "\(currentThemeModel.name.capitalized) Theme"
    }

    func getThemeColor() -> Color {
        switch currentThemeModel.color {
        case "orange":
            return Color.orange
        case "green":
            return Color.green
        case "red":
            return Color.red
        default:
            return Color.blue
        }
    }

    func choose(card: CardModel) {
        gameModel.choose(card: card)
    }
}
