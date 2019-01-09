//
//  PokemonCards.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import Foundation

struct PokemonCards: Codable {
    let cards: [CardInfo]
}

struct CardInfo: Codable {
    let attacks: [AttackInfo]
    let imageUrl: String?
    let imageUrlHiRes: String?
}

struct AttackInfo: Codable {
    let name: String
    let text: String
    let damage: String
}
