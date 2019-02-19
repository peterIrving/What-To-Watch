//
//  SingleViewController.swift
//  The 10 - Peter
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
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let movie = arrayOfMovies?.results?[movieIndex!] {
            
            if indexPath.row == 0 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleAndPosterCell", for: indexPath) as! TitleAndPosterCell
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
                
                // MARK: - Here I am trying to loop backwards through the overview to truncate super long overviews, like T-34. Not enough time.
                
//                if let count = movie.overview?.count {
//
//
//                    var overview = movie.overview
//
//                    if count > 445 {
//                        print("greater than 445")
//
//
//                        for char in (overview)!.reversed() {
//                            if char == "." {
//                                break
//                            }
//                            else {
//                                print(char)
//                            }
//                        }
//                    }
//                    else {
                        cell.summaryTextView.text = movie.overview
//                    }
//                }
                
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
