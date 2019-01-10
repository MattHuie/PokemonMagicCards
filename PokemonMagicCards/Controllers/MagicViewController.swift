//
//  MagicViewController.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit

class MagicViewController: UIViewController {
    
    @IBOutlet weak var magicCollectionView: UICollectionView!
    
    var magicCards = [MagicCardInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.magicCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magicCollectionView.dataSource = self
        magicCollectionView.delegate = self
        getMagicCards()
        
    }
    
    private func getMagicCards() {
        CardsAPIClient.getMagicCards { (error, cards) in
            if let error = error {
                print(error.errorMessage())
            }
            if let cards = cards {
                self.magicCards = cards.filter{$0.imageUrl != nil}
            }
        }
    }
}
extension MagicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return magicCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicCell", for: indexPath) as? MagicCardCell else {return UICollectionViewCell()}
        let cardInfo = magicCards[indexPath.row]
        cell.configureCell(card: cardInfo)
        return cell
    }
    
    
}

extension MagicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 130, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "magicDVC") as? MagicDetailViewController else { return }
        vc.modalPresentationStyle = .overCurrentContext
        vc.magicsCards = magicCards[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
    
}
