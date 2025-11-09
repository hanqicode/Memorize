//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Qi Han on 11/3/25.
//

import Foundation

struct MemorizeGame<CardContent> where CardContent: Equatable {
    // Only set method is private, but get is pubilc.
    private(set) var cards: [Card]

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards * 2 cards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex + 1)a", content: content))
            cards.append(Card(id: "\(pairIndex + 1)b", content: content))
        }
    }

    var indexOfTheOneAndOnlyFaceUpCard: Int?

    mutating func choose(card: Card) {
        if let chosenIndex = index(of: card) {
            if !canBeChosen(card: card) {
                print("[Warn] This card has already been chosen.")
                return
            }

            // If there's a card already faced up.
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // it's a match
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    print("Great, it's a match!")
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    indexOfTheOneAndOnlyFaceUpCard = nil
                } else {
                    print("Oh no...it's not a match!")
                    // It's not a match, and we should turn all cards face down.
                    for index in cards.indices {
                        if (cards[index].isMatched) {
                            continue;
                        }

                        cards[index].isFaceUp = false
                    }

                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
            } else {
                // If this is the first card to face up.
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }

            cards[chosenIndex].isFaceUp = true
        } else {
            print("[Error] Cannot find the index for the card.")
        }
    }

    private func canBeChosen(card: Card) -> Bool {
        !card.isMatched && !card.isFaceUp
    }

    private func index(of card: Card) -> Int? {
        cards.firstIndex(of: card)
    }

    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }

        // To be identifiable.
        let id: String

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
}
