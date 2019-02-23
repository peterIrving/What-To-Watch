//
//  Helpers.swift
//  What To Watch
//
//  Created by Peter Irving on 2/17/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

class MovieDataHelpers {
    
    static func fullLanguageName(languageAbbrv: String) -> String {
        
        switch languageAbbrv {
        case "en":
            return "English"
        case "ja":
            return "Japanese"
        case "ru":
            return "Russian"
        case "zh":
            return "Mandarin"
        case "fr":
            return "French"
        case "es":
            return "Spanish"
        case "it":
            return "Italian"
        default:
            return ""
        }
    }
    
    // This should be an API call
    static func grabGenres(listOfIds: [Int]) -> String{
        
        var arrayOfGenres: [String] = []
        
        var numberOfResponses = listOfIds.count
        if numberOfResponses > 3 {
            numberOfResponses = 3
        }
        
        for i in 0..<numberOfResponses {
            
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
    
    static func returnGenreString(arrayOfGenres: [String]) -> String {
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

