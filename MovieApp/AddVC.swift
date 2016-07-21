//
//  AddVC.swift
//  MovieApp
//
//  Created by Mark van Winden on 12-07-16.
//  Copyright © 2016 Mark van Winden. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    
    @IBOutlet weak var movieUrl: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var movieOpinion: UITextField!
    @IBOutlet weak var img: UIImageView!
    
    var movieImg: UIImage!
    var movieTitle = ""
    var movieOpinionStr = ""
    var movieUrlStr = ""
    var moviePlot = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confirmBtnPressed(sender: UIButton) {
        if movieImg != nil && movieTitle != "" && movieOpinionStr != "" && movieUrlStr != "" {
            let movie = Movie(movieImg: movieImg, movieTitle: movieTitle, movieOpinion: movieOpinionStr, movieUrl: movieUrlStr, moviePlot: moviePlot)
            DataService.instance.addMovie(movie)
            performSegueWithIdentifier("MainVC", sender: nil)
        }
    }
    
    @IBAction func urlHasBeenTyped(textField: UITextField) {
        let downloadManager = DownloadService()
        downloadManager.typedUrl = movieUrl.text
        self.movieUrlStr = movieUrl.text!
        downloadManager.downloadTitle { (title, succes) in
            if succes {
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.movieTitle = title
                })
            } else {
                self.errorLbl.text = "Title couldn't be loaded."
            }
            downloadManager.downloadImage({ (image, succes) in
                if succes {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.movieImg = image
                        self.img.image = image
                    })
                    
                } else {
                    self.errorLbl.text = "Image couldn't be loaded."
                }
            })
            
        }
        
    }
    
    @IBAction func opinionHasBeenTyped(sender: UITextField) {
        movieOpinionStr = movieOpinion.text!
    }
    
    @IBAction func backBtnPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
