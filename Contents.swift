//: Playground - noun: a place where people can play

import UIKit
import Foundation
// Skirmish is a simplified version of War - you and the computer each draw a card. The highest card wins, or, if they tie, winner is decided by suite.

enum Rank: Int {
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace
    
    static func allValues() -> [Rank] {
        return [Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace]
    }
}

enum Suit: Int {
    case Spades = 4, Hearts = 3, Diamonds = 2, Clubs = 1
    
    static func allValues() -> [Suit] {
        return [Spades, Hearts, Diamonds, Clubs]
    }
}
struct Card {
    let rank: Rank
    let suit: Suit
    init (rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}


class Deck {
    var internalDeck: [Card] = []
    init(){
        for rank in Rank.allValues() {
            for suit in Suit.allValues() {
                let card = Card(rank: rank, suit: suit)
                internalDeck.append(card)
            }
        }
        // function -> return value
        func drawOne() -> Card? {
            if internalDeck.isEmpty == false {
            let numberOfCardsLeft = internalDeck.count
            // generate a number between 0 and numberOfCardsLeft - 1)
            let randomIndex = arc4random_uniform(UInt32(numberOfCardsLeft))
            let ourCard = internalDeck.removeAtIndex(Int(randomIndex))
            return ourCard
            }
            else {
                return nil
            }
        }
    }
}

let deck = Deck()
let playerCard = deck.drawOne()!
let computerCard = deck.drawOne()!

compareCards(playerCard, computerCard)

let winningPlayer = compareCards(playerCard, computerCard: computerCard)

enum Player {
    case human
    case computer
}

// return true if player won, false if computer won
func compareCards(playerCard: Card, computerCard: Card) -> Player {
    if playerCard.rank.rawValue > computerCard.rank.rawValue {
        //if player card wins
        return Player.human
    }
    else  if  playerCard.rank.rawValue == computerCard.rank.rawValue {
        // compare suits because same rank
        if playerCard.suit.rawValue > computerCard.suit.rawValue {
            //player card wins
            return Player.human
        }
        else {
            //Computer wins
            return Player.computer
        }
    }
    else {
        // computer card wins
        return Player.computer
    }
    
    }
}

func printEndGameMessage(winningPlayer: Player, winningCard: Card){
    var winningPlayerString: String
    if winning Player == Player.human{
        winningPlayerString = "player"
        
    }
    else {
        winningPlayerString = "computer"
    }

}
 print("The \(winningplayer) won with \(winningcard) !")