//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Qi Han on 11/1/25.
//

import SwiftUI

@main
struct MemorizeApp: App {

    @StateObject private var gameViewModel: GameViewModel = GameViewModel()

    var body: some Scene {
        WindowGroup {
            EmojiMemoizeGameView(viewModel: gameViewModel)
        }
    }
}
