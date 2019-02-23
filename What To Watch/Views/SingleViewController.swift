//
//  SingleViewController.swift
//  What To Watch
//
//  Created by Peter Irving on 2/15/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class SingleViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    var arrayOfMovies: MovieList?
    var movieIndex: Int?
    var backgroundColor: UIColor = .white
    var isNowPlaying: Bool = true
    
    var imageExpanderView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isNowPlaying {
            collectionView.backgroundColor = UIColor.getCrimson()
        } else {
            collectionView.backgroundColor = UIColor.getRed()
        }
        
        collectionView.register(TitleAndPosterCell.self, forCellWithReuseIdentifier: "titleAndPosterCell")
        collectionView.register(DetailsCell.self, forCellWithReuseIdentifier: "detailsCell")
        collectionView.register(SummaryCell.self, forCellWithReuseIdentifier: "summaryCell")
        collectionView.register(ErrorLoadingDataCell.self, forCellWithReuseIdentifier: "errorCell")
        
        collectionView.isMultipleTouchEnabled = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
//    @objc func handleTap(sender: UITapGestureRecognizer) {
//    
//        print("gucci")
//    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let movie = arrayOfMovies?.results?[movieIndex!] {
            
            if indexPath.row == 0 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleAndPosterCell", for: indexPath) as! TitleAndPosterCell
                
                cell.delegate = self
                
//                let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
//
//                cell.addGestureRecognizer(tap)
                
                cell.posterImageView.loadImageUsingURL(pathAppendix: movie.posterPath!)
                cell.titleLabel.text = movie.title
                return cell
                
            } else if indexPath.row == 1 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCell", for: indexPath) as! DetailsCell
                
                let languageAbbr: String = movie.originalLanguage ?? ""
                cell.languageLabel.text = "Language: \(MovieDataHelpers.fullLanguageName(languageAbbrv: languageAbbr))"
                cell.releaseDateLabel.text = "Release date: \(movie.releaseDate!)"
                cell.genreLabel.text = MovieDataHelpers.grabGenres(listOfIds: movie.genreIDS!)
                
                return cell
                
            } else if indexPath.row == 2 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "summaryCell", for: indexPath) as! SummaryCell
                cell.summaryTextView.text = movie.overview

                return cell
                
            }
            else {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "errorCell", for: indexPath)
                return cell
            }
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "errorCell", for: indexPath)
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            return CGSize(width: view.frame.width, height: 440)
        }
        else if indexPath.row == 1{
            return CGSize(width: view.frame.width, height: 150)
        } else {
            return CGSize(width: view.frame.width, height: view.frame.width + 80)
        }
    }
    
}

extension SingleViewController: TitleAndPosterCellDelegate {
    
    
    func onTap(posterImage: UIImage) {
        print("image :", posterImage)
        
        let posterImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = posterImage
            return imageView
        }()
        
        // presents image expander
        let window = UIApplication.shared.keyWindow!
        imageExpanderView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: window.frame.size)
        imageExpanderView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        imageExpanderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissExpander(sender:))))
        super.view.isUserInteractionEnabled = false
        self.view.isUserInteractionEnabled = true
        
        // add posterImageView atop imageExpanderView
        let width = window.bounds.width - 14 - 14
        let height = width * 4.75 / 3.25 // ratio: 3.25 X 4.75 for movie posters
        posterImageView.frame.size = CGSize(width: width, height: height)
        posterImageView.center = window.center
        
        window.addSubview(imageExpanderView)
        imageExpanderView.addSubview(posterImageView)
    }
    
    @objc func dismissExpander(sender: UITapGestureRecognizer) {
        
        imageExpanderView.removeFromSuperview()

    }

}
