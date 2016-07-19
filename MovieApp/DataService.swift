//
//  DataService.swift
//  MovieApp
//
//  Created by Mark van Winden on 12-07-16.
//  Copyright © 2016 Mark van Winden. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var _loadedMovies = [Movie]()
    
    let KEY_MOVIES = "movies"
    
    var loadedMovies: [Movie] {
        return _loadedMovies
    }
    
    func saveMovies() {
        let moviesData = NSKeyedArchiver.archivedDataWithRootObject(_loadedMovies)
        NSUserDefaults.standardUserDefaults().setObject(moviesData, forKey: KEY_MOVIES)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadMovies() {
        if let moviesData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_MOVIES) as? NSData {
            if let moviesArray = NSKeyedUnarchiver.unarchiveObjectWithData(moviesData) as? [Movie] {
                self._loadedMovies = moviesArray
                self._loadedMovies = self._loadedMovies.reverse()
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "moviesLoaded", object: nil))
    }
    
    func saveImgAndCreatePath(image: UIImage) {
        
    }
    
    func imageForPath(path: String) {
        
    }
    
    func addMovie(movie: Movie) {
        _loadedMovies.append(movie)
        saveMovies()
        loadMovies()
    }
}


