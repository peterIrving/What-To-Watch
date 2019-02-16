//
//  ViewController.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/13/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrayOfMovies: MovieList?
    var selectionIndex: IndexPath.Element?
    
    let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addGestureRecognizer(createTapGesture())
    }

    @IBAction func dismissClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func createTapGesture() -> UITapGestureRecognizer{
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(sender:)))
        return tapRecognizer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SingleViewController
        
        destinationVC.arrayOfMovies = arrayOfMovies
        destinationVC.movieIndex = selectionIndex
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        let point = sender.location(in: collectionView)
        if let indexPath = collectionView?.indexPathForItem(at: point) {
            
            selectionIndex = indexPath[1]
            performSegue(withIdentifier: "goToSingle", sender: self)
            print(arrayOfMovies?.results![selectionIndex!])
            
        }
    }
    
    @IBAction func nowPlayingClick(_ sender: Any) {
        grabContent(urlString: getNowPlaying)
    }
    
    @IBAction func comingSoonClick(_ sender: Any) {
        grabContent(urlString: getUpcoming)
    }
    
    private func grabContent(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        networkingClient.executeURLSession(url) { (movieList) in
            self.arrayOfMovies = movieList
        }
        self.collectionView.reloadData()
    }
    
}

extension ListViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! ListViewCVCell
        
        if let movies = arrayOfMovies?.results! {
            
            let movie = movies[indexPath.row]
            
            if let backdropPath = movie.backdropPath {
                cell.posterImage.loadImageUsingURL(urlString: "https://image.tmdb.org/t/p/w500\(backdropPath)")
            }
            cell.posterImage.contentMode = .scaleAspectFit
        }
        cell.layoutIfNeeded()
        return cell
    }
}

