//
//  GameViewModel.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import SwiftUI

class GameViewModel {

    private let gameModel: GameModel
    private let allThemes: [ThemeModel]

    init() {
        allThemes = ThemeLibrary.all
        gameModel = GameModel(themeModel: allThemes.randomElement()!)
    }
}
