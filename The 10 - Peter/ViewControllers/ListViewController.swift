//
//  ViewController.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/13/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class ListViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var arrayOfMovies: MovieList?
    var selectionIndex: IndexPath.Element?
    var isNowPlaying: Bool = true
    
    var previousSelected: IndexPath?
    var currentSelected: Int?
    
    let networkingClient = NetworkingClient()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isNowPlaying {
            collectionView.backgroundColor = UIColor.getCrimson()
            grabContent(urlString: getNowPlaying)
        } else {
            collectionView.backgroundColor = UIColor.getRed()
            grabContent(urlString: getUpcoming)
        }
        
        collectionView.register(ListViewCVCell.self, forCellWithReuseIdentifier: "movieCell")
        collectionView.addGestureRecognizer(createTapGesture())
        
    }
    
    private func grabContent(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        networkingClient.grabMovieList(url) { (movieList, error) in
            if let error = error {
                print(error)
                return
            }
            self.arrayOfMovies = movieList
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
    }
    
    private func createTapGesture() -> UITapGestureRecognizer{
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(sender:)))
        return tapRecognizer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SingleViewController
        
        destinationVC.arrayOfMovies = arrayOfMovies
        destinationVC.movieIndex = selectionIndex
        destinationVC.isNowPlaying = isNowPlaying
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        let point = sender.location(in: collectionView)
        if let indexPath = collectionView?.indexPathForItem(at: point) {
            
            
            selectionIndex = indexPath[1]
            performSegue(withIdentifier: "goToSingle", sender: self)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! ListViewCVCell
        
        if let movies = arrayOfMovies?.results! {
            
            let movie = movies[indexPath.row]
            
            if let backdropPath = movie.backdropPath {
                cell.backdropImageView.loadImageUsingURL(pathAppendix: backdropPath)
            }
            cell.backdropImageView.contentMode = .scaleAspectFit
        }
        cell.layoutIfNeeded()

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 24, height: ((view.frame.width - 16) * 9 / 16))
    }
}

