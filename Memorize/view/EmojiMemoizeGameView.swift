//
//  EmojiMemoizeGameView.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import SwiftUI

struct EmojiMemoizeGameView: View {

    private let viewModel: GameViewModel

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
                    .foregroundStyle(viewModel.getThemeColor())

                Spacer()

                Text("Score:")
                    .foregroundStyle(viewModel.getThemeColor())
            }
            .padding()
        }
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
            // TODO: Adds new game logic here.
        }
    }
}

#Preview {
    EmojiMemoizeGameView(viewModel: GameViewModel())
}
