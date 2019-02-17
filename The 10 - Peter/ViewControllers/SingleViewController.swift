//
//  SingleViewController.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/15/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var backdropImage: CustomImageView!
    @IBOutlet weak var posterImage: CustomImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var summary: UITextView!
    
    var arrayOfMovies: MovieList?
    var movieIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    private func setupView() {
//        if let movie = arrayOfMovies?.results![movieIndex!] {
//            backdropImage.loadImageUsingURL(urlString: "https://image.tmdb.org/t/p/w500\(movie.backdropPath!)")
//            posterImage.loadImageUsingURL(urlString: "https://image.tmdb.org/t/p/w500\(movie.posterPath!)")
//            movieTitle.text = movie.title
//            summary.text = movie.overview
//        }
//
//    }
    

        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // guard let movie = arrayOfMovies?.results![movieIndex!] else { return errorLoadingCell}
        
        let titleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterAndTitleCell", for: indexPath) as! PosterAndTitleCVCell
        let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieDetailsCell", for: indexPath) as! MovieDetailsCVCell
        
        if indexPath.row == 0 {
            if let movie = arrayOfMovies?.results![movieIndex!] {
                titleCell.backdropView.loadImageUsingURL(urlString: "https://image.tmdb.org/t/p/w500\(movie.backdropPath!)")
                titleCell.posterImage.loadImageUsingURL(urlString: "https://image.tmdb.org/t/p/w500\(movie.posterPath!)")
                titleCell.movieTitle.text = movie.originalTitle
            }
            return titleCell
        }
        else {
            if let movie = arrayOfMovies?.results![movieIndex!] {
                detailCell.summary.text = movie.overview
                detailCell.adjustTextView()
            }
            return detailCell
        }
    }
}
