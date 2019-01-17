//
//  PokemonDetailViewController.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemonDetails: CardInfo!
    //var attacks = [AttackInfo]()a
    
    @IBOutlet weak var pokemonCardImage: UIImageView!
    @IBOutlet weak var pokemonActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pokemonDetailCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonDetailCollectionView.delegate = self
        pokemonDetailCollectionView.dataSource = self
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goBack))
        self.view.addGestureRecognizer(gesture)

        
    }
    
    @objc func goBack() {
       dismiss(animated: true, completion: nil)
    }
    
    
}
extension PokemonDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonDetails.attacks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = pokemonDetailCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonDetailCell", for: indexPath) as? PokemonDetailCell else {return UICollectionViewCell()}
        let pokemon = pokemonDetails.attacks[indexPath.row]
        cell.attackNameLabel.text = pokemon.name
        cell.attackText.text = pokemon.text
        cell.damageLabel.text = pokemon.damage
        
        
        ImageHelper.shared.fetchImage(urlString: pokemonDetails.imageUrl ?? "") { (error, image) in
            if let error = error {
                print("Error: \(error)")
            } else {
                if let image = image {
                    self.pokemonCardImage.image = image
                }
            }
        }
        
        
        //pokemonCardImage.image = pokemonDetails.imageUrl
        return cell
    }
    
    
}
extension PokemonDetailViewController: UICollectionViewDelegateFlowLayout {
    
}
