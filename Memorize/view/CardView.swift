//
//  CardView.swift
//  Memorize
//
//  Created by Qi Han on 11/10/25.
//

import SwiftUI

struct CardView: View {

    private let cardModel: CardModel
    private let baseRoundedRectangle: RoundedRectangle
    private let themeColor: Color

    init(cardModel: CardModel, themeColor: Color) {
        self.cardModel = cardModel
        self.baseRoundedRectangle = RoundedRectangle(cornerRadius: 12)
        self.themeColor = themeColor
    }

    var body: some View {
        ZStack {

            // Face down.
            Group {
                baseRoundedRectangle
                    .foregroundStyle(Color.white)
                baseRoundedRectangle
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    .foregroundStyle(themeColor)
                Text(cardModel.content)
                    .font(Font.system(size: 40))
            }
            .opacity(cardModel.isFaceUp ? 1 : 0)

            // Face up.
            baseRoundedRectangle
                .foregroundStyle(themeColor)
                .opacity(cardModel.isFaceUp ? 0 : 1)
        }
    }
}
