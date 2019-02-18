//
//  CustomImageView.swift
//  The 10 - Peter
//
//  Created by Peter Irving on 2/13/19.
//  Copyright © 2019 Peter Irving. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    private var imageUrlString: String?
    private var imageDownloadTask: URLSessionDataTask?
    
    let pathToImages = "https://image.tmdb.org/t/p/w500"
    
    func loadImageUsingURL(pathAppendix: String) {
        
        let urlString = pathToImages + pathAppendix
        
        imageUrlString = urlString
        let nsString = NSString(string: urlString)
        let session = URLSession.shared
        
        // saves url into cache as NSString
        if let imageFromCache = imageCache.object(forKey: nsString) {
            self.image = imageFromCache
            return
        }
        
        guard let requestURL = URL(string: urlString) else {
            print("request not working", urlString)
            self.image = UIImage(named: "imageUploadFail")
            return
        }
        
        let request = URLRequest(url: requestURL)
        imageDownloadTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                print(error)
                self.image = UIImage(named: "imageUploadFail")
                return
            }
            if let imageToCache = UIImage(data: data!) {
                DispatchQueue.main.async {
                    if self.imageUrlString == urlString {
                        self.image = imageToCache
                    }
                }
                imageCache.setObject(imageToCache, forKey: nsString)
            }
        })
        imageDownloadTask?.resume()
    }
    
    func cancleDownload(){
        if imageDownloadTask != nil{
            imageDownloadTask?.cancel()
        }
    }
    
}
