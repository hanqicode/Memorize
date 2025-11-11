//
//  EmojiMemoizeGameView.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import SwiftUI

struct EmojiMemoizeGameView: View {

    let viewModel: GameViewModel

    var body: some View {
        VStack {
            titleSection

            Spacer()

            cardsSection

            Spacer()

            newGameButton
        }
        .padding()
    }

    private var titleSection: Text {
        Text("Memorize!")
            .font(Font.system(size: 30))
    }

    private var cardsSection: some View {
        Text("Cards Section")
    }

    private var newGameButton: some View {
        Button("New Game") {
            // TODO: Adds new game logic here.
        }
    }
}

#Preview {
    EmojiMemoizeGameView(viewModel: GameViewModel())
}
