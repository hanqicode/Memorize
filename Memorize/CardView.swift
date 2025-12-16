//
//  CardView.swift
//  Memorize
//
//  Created by Qi Han on 12/15/25.
//

import SwiftUI

struct CardView: View {

    typealias Card = MemorizeGame<String>.Card

    var card: Card

    init(card: Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let baseRoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                baseRoundedRectangle
                    .foregroundStyle(Color.white)
                baseRoundedRectangle
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    .foregroundStyle(Color.orange)
                Pie()
                    .opacity(0.4)
                    .foregroundStyle(Color.orange)
                    .overlay(
                        Text(card.content)
                            .font(Font.system(size: 50))
                    )
                    // Leave padding between the circle and the rectangle.
                    .padding(5)
            }
            // 1 means visible, 0 means transparent.
            .opacity(card.isFaceUp ? 1 : 0)
            baseRoundedRectangle
                .foregroundStyle(Color.orange)
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    CardView(
        card: MemorizeGame<String>.Card(
            id: "test",
            isFaceUp: true,
            content: "X"
        )
    )
    .padding(20)
    .foregroundColor(Color.green)
}
