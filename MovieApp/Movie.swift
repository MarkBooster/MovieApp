//
//  Movie.swift
//  MovieApp
//
//  Created by Mark van Winden on 12-07-16.
//  Copyright © 2016 Mark van Winden. All rights reserved.
//

import Foundation

class Movie {
    
    private var _movieImg: String
    private var _movieTitle: String
    private var _movieOpinion: String
    private var _movieUrl: String
    
    var movieImg: String {
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
    
    init(movieImg: String, movieTitle: String, movieOpinion: String, movieUrl: String) {
        self._movieImg = movieImg
        self._movieTitle = movieTitle
        self._movieOpinion = movieOpinion
        self._movieUrl = movieUrl
    }
}
