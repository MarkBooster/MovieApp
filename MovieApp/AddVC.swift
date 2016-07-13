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
    
    var movieTitle = String()
    var movieOpinionStr = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: movieUrl.text!)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            if let responseData = data {
                let webContent = NSString(data: responseData, encoding: NSUTF8StringEncoding)!
                let websiteArray = webContent.componentsSeparatedByString("<title>")
                if websiteArray.count > 0 {
                    let titleArray = websiteArray[1].componentsSeparatedByString(" (")
                    self.movieTitle = titleArray[0]
                }
            }
        }
        task.resume()
    }
    
    @IBAction func backBtnPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func confirmBtnPressed(sender: UIButton) {
        if movieUrl.text != nil && movieUrl.text != "" && movieOpinion.text != nil && movieOpinion.text != "" {
            self.movieOpinionStr = movieOpinion.text!
            print(movieTitle)
            print(movieOpinionStr)
            performSegueWithIdentifier("MainVC", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MainVC" {
            if let mainVC = segue.destinationViewController as? MainVC {
            }
        }
    }
    
    func addMovie(movie: Movie) {
        
    }

}
