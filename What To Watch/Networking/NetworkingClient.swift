//
//  NetworkingClient.swift
//  What To Watch
//
//  Created by Peter Irving on 2/13/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class NetworkingClient {
    
    func grabMovieList(_ url: URL, callback: @escaping(MovieList?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            if let error = error {
                print(error.localizedDescription)
                callback(nil, error)
            }
            // also check response status 200 okay
            
            guard let data = data else { return }

            do {
                let movieList = try JSONDecoder().decode(MovieList.self, from: data)
                print("movieList Decoded")
                callback(movieList, nil)
               
            } catch {
                print(error, "error parsing")
                callback(nil, error)
            }
        }.resume()
    }
}
