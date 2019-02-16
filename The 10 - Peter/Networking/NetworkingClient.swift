//
//  NetworkingClient.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/13/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class NetworkingClient {
    
    func executeURLSession(_ url: URL, callback: @escaping(MovieList?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, respose, error) in
           
            if let error = error {
                print(error.localizedDescription)
            }
            // also check response status 200 okay
            
            guard let data = data else { return }

            do {
                let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                print("movieList Decoded")
                callback(movieList)
               
            } catch {
                print(error, "error parsing")
                callback(nil)
            }
        }.resume()

    }
    
    func getImageFromURL(urlString: String) -> UIImage? {
        
        var returnedImage: UIImage?
        
        if let url = URL(string: urlString) {
            
            do {
                let data = try Data(contentsOf: url)
                returnedImage = UIImage(data: data)!
            } catch let err {
                print("Error: ", err.localizedDescription)
            }
        }
        return returnedImage
    }
    
//    func grabContent(urlString: String, destinationVC: UIViewController) {
//        guard let url = URL(string: urlString) else { return }
//        
//        self.executeURLSession(url) { (movieList) in
//            destinationVC.arrayOfMovies = movieList
//        }
//    }
}
