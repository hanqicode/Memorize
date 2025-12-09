//
//  GameModel.swift
//  Memorize
//
//  Created by Qi Han on 11/9/25.
//

import Foundation

struct GameModel {

    private(set) var cards: [CardModel]
    private var visitedCardIndexes: Set<Int>
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    private var score: Int

    init(themeModel: ThemeModel) {
        cards = []
        visitedCardIndexes = []
        score = 0

        // Builds the cards array.
        for index in 0..<themeModel.emojis.count {
            let content = themeModel.emojis[index]
            let cardA = CardModel(id: "\(index + 1)a", content: content)
            let cardB = CardModel(id: "\(index + 1)b", content: content)
            cards.append(contentsOf: [cardA, cardB])
        }

        // Shuffles the cards array after initialization.
        self.shuffle()
    }

    // CardModel is struct type so we cannot modify card directly.
    mutating func choose(card: CardModel) {
        let chosenIndex = self.index(card: card)

        if (!canBeChosen(card: card)) {
            return
        }

        cards[chosenIndex].isFaceUp = true

        // If there's no card faced up.
        if (indexOfTheOneAndOnlyFaceUpCard == nil) {
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            return
        }

        // There's a card faced up.
        let facedUpIndex = indexOfTheOneAndOnlyFaceUpCard!

        // If it's a match.
        if (cards[chosenIndex].content == cards[facedUpIndex].content) {
            cards[chosenIndex].isMatched = true
            cards[facedUpIndex].isMatched = true
            visitedCardIndexes.insert(facedUpIndex)
            visitedCardIndexes.insert(chosenIndex)
            indexOfTheOneAndOnlyFaceUpCard = nil
            score += 2
        } else {
            // If it's mismatch, turn the first card face down
            // and keep the second card face up.
            cards[facedUpIndex].isFaceUp = false
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex

            // If the facedUpIndex/chosenIndex is visited, -1.
            if (visitedCardIndexes.contains(facedUpIndex)) {
                score -= 1
            }

            if (visitedCardIndexes.contains(chosenIndex)) {
                score -= 1
            }

            visitedCardIndexes.insert(facedUpIndex)
            visitedCardIndexes.insert(chosenIndex)
        }
    }

    private func canBeChosen(card: CardModel) -> Bool {
        return !card.isMatched && !card.isFaceUp
    }

    private func index(card: CardModel) -> Int {
        return cards.firstIndex(of: card)!
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    func getScore() -> Int {
        return score
    }
}
