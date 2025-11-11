//
//  EmojiMemoizeGameView.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import SwiftUI

struct EmojiMemoizeGameView: View {

    @ObservedObject private var viewModel: GameViewModel

    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
    }

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

    private var titleSection: some View {
        VStack {
            Text("Memorize!")
                .font(Font.system(size: 30))

            HStack {
                Text(viewModel.getThemeName())

                Spacer()

                Text("Score:")
            }
            .padding()
        }
        .foregroundStyle(viewModel.getThemeColor())
    }

    private var cardsSection: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
                ForEach(viewModel.getCards(), id: \.id) { cardModel in
                    CardView(
                        cardModel: cardModel,
                        themeColor: viewModel.getThemeColor()
                    )
                    .aspectRatio(2 / 3, contentMode: ContentMode.fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card: cardModel)
                    }
                }
            }
        }
    }

    private var newGameButton: some View {
        Button("New Game") {
            viewModel.newGame()
        }
        .foregroundStyle(viewModel.getThemeColor())
    }
}

#Preview {
    EmojiMemoizeGameView(viewModel: GameViewModel())
}
