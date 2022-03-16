//
//  MovieCategoryTableViewCell.swift
//  Movie Hub
//
//  Created by Symoon Zadid on 22/2/22.
//

import UIKit
import SDWebImage
class MovieCategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var movieCategoryLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let object = NetworkManager()
    var movieDetails = [Petition](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        movieCategoryLabel.text = "symoon"
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
        object.getData{( response) in
            if let response = response{
                self.movieDetails = response.results
            }
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MovieCategoryTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieDetails.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as! MovieDetailsCollectionViewCell
        let movieData = self.movieDetails[indexPath.row]
        cell.movieName.text = movieData.original_title
        
        if let movieUrl = movieData.fullPosterPath {
            cell.setUp(with: movieUrl)
        }
        return cell
    }
}
