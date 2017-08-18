//
//  SampleData.swift
//  storyboards
//
//  Created by Bamby on 18/8/17.
//  Copyright © 2017 Juan S. Landy. All rights reserved.
//

import Foundation

final class SampleData {
    static func generatePlayersData() -> [Player] {
        return [
            Player(name: "Bill Evans", game: "Tic-Tac-Toe", rating: 4),
            Player(name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
            Player(name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2)
        ]
    }
}
