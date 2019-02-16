//
//  WelcomeView.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/14/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var inTheatersView: UIView!
    @IBOutlet weak var comingSoonView: UIView!
    
    var tapIndex: Int = 0
    let networkingClient = NetworkingClient()
    
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
            grabContent(urlString: getNowPlaying, destinationVC: destinationVC)
            destinationVC.navigationItem.title = "In Theaters"

        }
        if tapIndex == 1 {
            grabContent(urlString: getUpcoming, destinationVC: destinationVC)
            destinationVC.navigationItem.title = "Coming Soon"
        }
        
    }
    
    private func grabContent(urlString: String, destinationVC: ListViewController) {
        guard let url = URL(string: urlString) else { return }
        
        networkingClient.executeURLSession(url) { (movieList) in
            destinationVC.arrayOfMovies = movieList
        }
    }
}
