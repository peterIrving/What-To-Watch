//
//  NetworkingClient.swift
//  The 10 - Peter
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
    
    // This should be an API call
    func grabGenres(listOfIds: [Int]) -> String{
        
        var arrayOfGenres: [String] = []
        
        for i in 0..<listOfIds.count {
            
            switch listOfIds[i] {
            case 28:
                arrayOfGenres.append("Action")
            case 12:
                arrayOfGenres.append("Adventure")
            case 16:
                arrayOfGenres.append("Animation")
            case 35:
                arrayOfGenres.append("Comedy")
            case 80:
                arrayOfGenres.append("Crime")
            case 99:
                arrayOfGenres.append("Documentary")
            case 18:
                arrayOfGenres.append("Drama")
            case 10751:
                arrayOfGenres.append("Family")
            case 14:
                arrayOfGenres.append("Fantasy")
            case 36:
                arrayOfGenres.append("History")
            case 27:
                arrayOfGenres.append("Horror")
            case 10402:
                arrayOfGenres.append("Music")
            case 9648:
                arrayOfGenres.append("Mystery")
            case 10749:
                arrayOfGenres.append("Romance")
            case 878:
                arrayOfGenres.append("Science Fiction")
            case 10770:
                arrayOfGenres.append("TV Movie")
            case 53:
                arrayOfGenres.append("Thriller")
            case 10752:
                arrayOfGenres.append("War")
            case 37:
                arrayOfGenres.append("Western")
            default:
                arrayOfGenres.append("Other")
            }
            
        }
        
        return returnGenreString(arrayOfGenres: arrayOfGenres)
    }
    
    func returnGenreString(arrayOfGenres: [String]) -> String {
        var stringOfGenres = "Genre: "
        if arrayOfGenres.count > 1 {
            stringOfGenres = "Genres: "
        }
        for i in 0..<arrayOfGenres.count {
            if i != arrayOfGenres.count - 1 {
                stringOfGenres += "\(arrayOfGenres[i]), "
            } else {
                stringOfGenres += "\(arrayOfGenres[i])"
            }
        }
        return stringOfGenres
    }
}
