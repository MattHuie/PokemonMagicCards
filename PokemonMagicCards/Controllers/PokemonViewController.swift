//
//  ViewController.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    var pokemonCards = [CardInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
        getPokeCards()
        
        
    }
    
    private func getPokeCards() {
        CardsAPIClient.getPokemonCards { (error, cards) in
            if let error = error {
                print(error.errorMessage())
            }
            if let cards = cards {
                self.pokemonCards = cards.filter{$0.imageUrl != nil && $0.imageUrlHiRes != nil} 
            }
        }
    }


}
extension PokemonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCardCell else {return UICollectionViewCell()}
        
        // add code here
        
        return cell
    }
    
    
}

extension PokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 125, height: 175)
    }
}
