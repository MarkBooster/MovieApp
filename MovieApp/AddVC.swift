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
    @IBOutlet weak var movieOpinion: UITextField!
    
    var movieTitle = ""
    var movieOpinionStr = ""
    var Url = ""
    var moviePlot = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func confirmBtnPressed(sender: UIButton) {
            if movieTitle != "" && movieOpinionStr != "" {
                let movie = Movie(movieImg: "", movieTitle: movieTitle, movieOpinion: movieOpinionStr, movieUrl: Url, moviePlot: moviePlot)
                DataService.instance.addMovie(movie)
                performSegueWithIdentifier("MainVC", sender: nil)
        }
    }
    
    @IBAction func urlHasBeenTyped(textField: UITextField) {
        let url = NSURL(string: movieUrl.text!)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            if let responseData = data {
                let webContent = NSString(data: responseData, encoding: NSUTF8StringEncoding)!
                let websiteArray = webContent.componentsSeparatedByString("<title>")
                if websiteArray.count > 0 {
                    let titleArray = websiteArray[1].componentsSeparatedByString(" (")
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.movieTitle = titleArray[0]
                        self.Url = String(url)
                    })
                }
            }
        }
        task.resume()
    }
    
    @IBAction func opinionHasBeenTyped(sender: UITextField) {
        movieOpinionStr = movieOpinion.text!
    }
    
    
    
    
    

}
