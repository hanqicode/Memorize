//
//  ContentView.swift
//  Memorize
//
//  Created by Qi Han on 11/1/25.
//

import SwiftUI

struct ContentView: View {

    // Constants.
    private let title: String = "Memorize!"
    private let vehicles: [String] = ["✈️", "🛳️", "🚀", "🚁"]
    private let vegetables: [String] = ["🥕", "🥦", "🥬", "🥒", "🌽"]
    private let sports: [String] = ["⚽", "🏀", "🏐", "🏈", "⚾", "🎾"]

    // Fields.
    @State private var emojis: [String]

    init() {
        emojis = vehicles + vehicles
        emojis = emojis.shuffled()
    }

    // Override.
    var body: some View {
        VStack {
            gameTitle

            ScrollView {
                cards
            }

            Spacer()

            themeToggler
        }
        .padding()
    }

    var gameTitle: some View {
        Text(title)
            .font(.largeTitle)
            .foregroundStyle(Color.primary)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60, maximum: 180))]) {
            // Like Java lambda expression
            // symbol -> {xxxx};
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    // fit: 完整显示，不裁切
                    .aspectRatio(2 / 3, contentMode: ContentMode.fit)
            }
        }
    }

    var themeToggler: some View {
        HStack(alignment: .bottom) {
            Spacer()

            toggleTheme(theme: "Vehicles")

            Spacer()

            toggleTheme(theme: "Vegetables")

            Spacer()

            toggleTheme(theme: "Sports")

            Spacer()
        }
    }

    func toggleTheme(theme: String) -> some View {
        VStack {
            Button(
                action: {
                    if theme == "Vehicles" {
                        emojis = vehicles + vehicles
                    } else if theme == "Vegetables" {
                        emojis = vegetables + vegetables
                    } else {
                        emojis = sports + sports
                    }

                    emojis = emojis.shuffled()

                    print("Change theme to \(theme)")
                },
                label: {
                    VStack {
                        if theme == "Vehicles" {
                            Image(systemName: "car")
                                .font(.largeTitle)
                        } else if theme == "Vegetables" {
                            Image(systemName: "carrot")
                                .font(.largeTitle)
                        } else {
                            Image(systemName: "basketball")
                                .font(.largeTitle)
                        }
                        Text(theme)
                            .foregroundStyle(Color.blue)
                            .font(Font.caption)
                    }
                }
            )
        }
    }
}

struct CardView: View {

    @State private var isFaceUp: Bool
    private let baseRoundedRectangle: RoundedRectangle
    private let content: String

    init(isFaceUp: Bool = false, content: String) {
        self.isFaceUp = isFaceUp
        self.baseRoundedRectangle = RoundedRectangle(cornerRadius: 12)
        self.content = content
    }

    var body: some View {
        ZStack {
            Group {
                baseRoundedRectangle
                    .foregroundStyle(Color.white)
                baseRoundedRectangle
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    .foregroundStyle(Color.red)
                Text(content)
                    .font(Font.largeTitle)
            }
            // 1 means visible, 0 means transparent.
            .opacity(isFaceUp ? 1 : 0)

            baseRoundedRectangle
                .foregroundStyle(Color.red)
                .opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
