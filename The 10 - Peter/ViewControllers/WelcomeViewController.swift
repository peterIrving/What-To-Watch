//
//  WelcomeView.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/14/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

// TODO:

//1) truncate uber long text or shrink cell size, and force someone to click on cell to read entire summary
//2) black borders around welcome buttons and single view poster(and border)
//3) darken welcome buttons on selection
//4) on list pan, darken cv cell and show title
//5) loading screens(primarily for displaying list view)
//6) image expander on poster (and summary)

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var inTheatersView: UIView!
    @IBOutlet weak var comingSoonView: UIView!
    
    var tapIndex: Int = 0
    let networkingClient = NetworkingClient()
    var isReadyToSegue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inTheatersView.addGestureRecognizer(createTapGesture())
        comingSoonView.addGestureRecognizer(createTapGesture())
    }
    
    func createTapGesture() -> UITapGestureRecognizer{
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(sender:)))
     
        return tapRecognizer
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        
        if sender.view == inTheatersView {
            tapIndex = 0
        }
        if sender.view == comingSoonView{
            tapIndex = 1
        }
        performSegue(withIdentifier: "goToList", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: ListViewController = segue.destination as! ListViewController
        
        if tapIndex == 0 {
            destinationVC.navigationItem.title = "In Theaters"
            destinationVC.isNowPlaying = true
        }
        if tapIndex == 1 {
            destinationVC.navigationItem.title = "Coming Soon"
            destinationVC.isNowPlaying = false
        }
        
    }
    
    private func grabContent(urlString: String, destinationVC: ListViewController) {
        guard let url = URL(string: urlString) else { return }
        
        networkingClient.grabMovieList(url) { (movieList, error) in
            if let error = error {
                print(error)
                return
            }
            destinationVC.arrayOfMovies = movieList
        }
    }
}
