//
//  Cell.swift
//  MovieApp
//
//  Created by Mark van Winden on 12-07-16.
//  Copyright © 2016 Mark van Winden. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOpinion: UILabel!
    @IBOutlet weak var movieUrl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImg.layer.cornerRadius = 20
        movieImg.clipsToBounds = true
    }
    
    func configureCell(movie: Movie) {
        //De afbeelding moet nog...
        movieTitle.text = movie.movieTitle
        movieOpinion.text = movie.movieOpinion
        movieUrl.text = movie.movieUrl
    }
}
