//
//  DownloadService.swift
//  MovieApp
//
//  Created by Mark van Winden on 19-07-16.
//  Copyright © 2016 Mark van Winden. All rights reserved.
//

import Foundation
import UIKit

class DownloadService {
    
    var typedUrl: String!
    
    let ERROR_MESSAGE = "Something went wrong."
    
    func downloadTitle(titleAquired:(title: String, succes: Bool) -> Void) {
        let url = NSURL(string: typedUrl)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            if error == nil {
                if let responseData = data {
                    let webContent = NSString(data: responseData, encoding: NSUTF8StringEncoding)!
                    let websiteArray = webContent.componentsSeparatedByString("<title>")
                    if websiteArray.count > 0 {
                        let titleArray = websiteArray[1].componentsSeparatedByString(" (")
                        let title = titleArray[0]
                        titleAquired(title: title, succes: true)
                    }
                }
            } else {
                titleAquired(title: "", succes: false)
            }
        }
        task.resume()
    }
    
    func downloadImage(imageAquired:(image: UIImage, succes: Bool) -> Void) {
        let url = NSURL(string: typedUrl)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            if error == nil {
                if let responsData = data {
                    let webContent = NSString(data: responsData, encoding: NSUTF8StringEncoding)!
                    let websiteArray1 = webContent.componentsSeparatedByString("content=\"main\" />")
                    if websiteArray1.count > 0 {
                        let websiteArray2 = websiteArray1[1].componentsSeparatedByString("\">")
                        if websiteArray2.count > 0 {
                            let websiteArray3 = websiteArray2[0].componentsSeparatedByString("href=\"")
                            if websiteArray3.count > 0 {
                                let imageUrl = websiteArray3[1]
                                let url2 = NSURL(string: imageUrl)!
                                let task2 = NSURLSession.sharedSession().dataTaskWithURL(url2, completionHandler: { (data, response, error) in
                                    if error == nil {
                                        if let imageData = data {
                                            imageAquired(image: UIImage(data: imageData)!, succes: true)
                                        }
                                    }
                                })
                                task2.resume()
                            }
                            
                            
                        }
                        
                    }
                }
            } else {
                imageAquired(image: UIImage(named: "")!, succes: false)
            }
        }
        task.resume()
    }
}
