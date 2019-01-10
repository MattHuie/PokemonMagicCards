//
//  MagicDetailCell.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit

class MagicDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var magicDetailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageNameLabel: UILabel!
    @IBOutlet weak var cardText: UITextView!
    @IBOutlet weak var magicActivityIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        magicDetailImage.image = nil
    }
    
    private var urlString = ""
    
    public func configureDetailCell(card: ForeignCards) {
        guard let imageURLString = card.imageUrl else {
            return
        }
        urlString = imageURLString
        
        if let image = ImageHelper.shared.image(forKey: imageURLString as NSString) {
            magicDetailImage.image = image
        } else {
            magicActivityIndicator.startAnimating()
            ImageHelper.shared.fetchImage(urlString: imageURLString) { (appError, image) in
                if let appError = appError {
                    print(appError.errorMessage())
                } else if let image = image {
                    if self.urlString == imageURLString {
                        self.magicDetailImage.image = image
                    }
                }
                self.magicActivityIndicator.stopAnimating()
            }
        }
    }
}
