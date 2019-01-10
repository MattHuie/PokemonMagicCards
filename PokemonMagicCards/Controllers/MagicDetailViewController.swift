//
//  MagicDetailViewController.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit

class MagicDetailViewController: UIViewController {
    
    @IBOutlet weak var magicDetailCollectionView: UICollectionView!
   
    var magicsCards: MagicCardInfo!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        magicDetailCollectionView.dataSource = self
        magicDetailCollectionView.delegate = self

        
    }
    

}
extension MagicDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return magicsCards.foreignNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicDetailCell", for: indexPath) as? MagicDetailCell else {return UICollectionViewCell()}
        let detailCardInfo = magicsCards.foreignNames[indexPath.row]
        cell.languageNameLabel.text = detailCardInfo.language
        cell.cardText.text = detailCardInfo.text
        cell.nameLabel.text = detailCardInfo.name
        cell.configureDetailCell(card: detailCardInfo)
        return cell
    }
}

extension MagicDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 280, height: 400)
    }
}


