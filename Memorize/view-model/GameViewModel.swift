//
//  GameViewModel.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {

    @Published private var gameModel: GameModel
    private var currentThemeModel: ThemeModel
    private let allThemeModels: [ThemeModel]

    init() {
        allThemeModels = ThemeLibrary.all
        currentThemeModel = allThemeModels.randomElement()!
//        currentThemeModel = allThemeModels[0]
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

    func newGame() {
        currentThemeModel = allThemeModels.randomElement()!
        gameModel = GameModel(themeModel: currentThemeModel)
        print("New game started with theme: \(currentThemeModel.name)")
    }

    func choose(card: CardModel) {
        gameModel.choose(card: card)
    }
}
