//
//  MagicCards.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import Foundation

struct MagicCards: Codable {
    let cards: [MagicCardInfo]
}

struct MagicCardInfo: Codable {
    let name: String
    let imageUrl: String
    let text: String
    let foreignNames: [ForeignInfo]
}

struct ForeignInfo: Codable {
    let name: String
    let text: String
    let imageUrl: String
    let language: String
}
