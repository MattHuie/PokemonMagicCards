//
//  MagicCardCell.swift
//  PokemonMagicCards
//
//  Created by Matthew Huie on 1/9/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import UIKit

class MagicCardCell: UICollectionViewCell {
    
    @IBOutlet weak var magicCardImage: UIImageView!
    @IBOutlet weak var magicCollectionActivityIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        magicCardImage.image = nil
    }
    
    private var urlString = ""
    public func configureCell(card: MagicCardInfo) {
        
        
        guard let imageURLString = card.imageUrl else {
            return
        }
        
        urlString = imageURLString
        
        if let image = ImageHelper.shared.image(forKey: imageURLString as NSString) {
            magicCardImage.image = image
        } else {
            magicCollectionActivityIndicator.startAnimating()
            ImageHelper.shared.fetchImage(urlString: imageURLString) { (appError, image) in
                if let appError = appError {
                    print(appError.errorMessage())
                } else if let image = image {
                    if self.urlString == imageURLString {
                        self.magicCardImage.image = image
                    }
                }
                self.magicCollectionActivityIndicator.stopAnimating()
            }
        }
    }
}
