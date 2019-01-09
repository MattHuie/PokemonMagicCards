//
//  CardsAPIClient.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import Foundation

final class CardsAPIClient {
    static func getPokemonCards (completionHandler: @escaping (AppError?, [CardInfo]?) -> Void) {
        let urlString = "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data, response) in
            if let error = error {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let cards = try JSONDecoder().decode(PokemonCards.self, from: data)
                    completionHandler(nil, cards.cards)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
       
    }
    
    static func getMagicCards (completionHandler: @escaping (AppError?, [MagicCardInfo]?) -> Void) {
        let urlString = "https://api.magicthegathering.io/v1/cards?contains=imageUrl"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data, response) in
            if let error = error {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let cards = try JSONDecoder().decode(MagicCards.self, from: data)
                    completionHandler(nil, cards.cards)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
}
