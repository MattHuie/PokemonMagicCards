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
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension MagicDetailViewController: UICollectionViewDelegateFlowLayout {
    
}
