//
//  games.swift
//  APIApp
//
//  Created by Lance Davenport on 1/6/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//

import UIKit

class Games: Codable {
    let games: [Game]
    init(games: [Game]) {
        self.games = games
    }
}


class Game: Codable {
    let name: String
    init(name: String) {
        self.name = name
    }
}

