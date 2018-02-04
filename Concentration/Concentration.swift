//
//  Concentration.swift
//  Concentration
//
//  Created by Adolfo Onrubia on 3/2/18.
//  Copyright © 2018 Onrubia. All rights reserved.
//

import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFacedUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    func resetGame() {
        indexOfOneAndOnlyFaceUpCard = nil
        for index in cards.indices {
            cards[index].isFacedUp = false
            cards[index].isMatched = false
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        if numberOfPairsOfCards > 3 {
            for index in cards.indices {
                cards[index] = cards[Int(arc4random_uniform(UInt32(cards.count)))]
            }
        }
        // TODO: Shuffle the cards
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

