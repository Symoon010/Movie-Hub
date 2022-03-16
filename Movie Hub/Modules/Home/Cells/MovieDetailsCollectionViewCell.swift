//
//  MovieDetailsCollectionViewCell.swift
//  Movie Hub
//
//  Created by Symoon Zadid on 22/2/22.
//

import UIKit

class MovieDetailsCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    
    
    
func setUp(with imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        moviePoster.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "Paypal"), options: .highPriority, context: nil)
    
}
}



