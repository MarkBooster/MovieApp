//
//  Movie.swift
//  MovieApp
//
//  Created by Mark van Winden on 12-07-16.
//  Copyright © 2016 Mark van Winden. All rights reserved.
//

import Foundation
import UIKit

class Movie: NSObject, NSCoding {
    
    private var _movieImg: UIImage!
    private var _movieTitle: String!
    private var _movieOpinion: String!
    private var _movieUrl: String!
    private var _moviePlot: String!
    
    var movieImg: UIImage {
        return _movieImg
    }
    
    var movieTitle: String {
        return _movieTitle
    }
    
    var movieOpinion: String {
        return _movieOpinion
    }
    
    var movieUrl: String {
        return _movieUrl
    }
    
    var moviePlot: String {
        return _moviePlot
    }
    
    init(movieImg: UIImage, movieTitle: String, movieOpinion: String, movieUrl: String, moviePlot: String) {
        self._movieImg = movieImg
        self._movieTitle = movieTitle
        self._movieOpinion = movieOpinion
        self._movieUrl = movieUrl
        self._moviePlot = moviePlot
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._movieImg, forKey: "movieImg")
        aCoder.encodeObject(self._movieTitle, forKey: "title")
        aCoder.encodeObject(self._movieOpinion, forKey: "opinion")
        aCoder.encodeObject(self._movieUrl, forKey: "url")
        aCoder.encodeObject(self._moviePlot, forKey: "moviePlot")
    }
    
    override init() {
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._movieImg = aDecoder.decodeObjectForKey("movieImg") as? UIImage
        self._movieTitle = aDecoder.decodeObjectForKey("title") as? String
        self._movieOpinion = aDecoder.decodeObjectForKey("opinion") as? String
        self._movieUrl = aDecoder.decodeObjectForKey("url") as? String
        self._moviePlot = aDecoder.decodeObjectForKey("moviePlot") as? String
    }
}
