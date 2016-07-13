//
//  ViewController.swift
//  MovieApp
//
//  Created by Mark van Winden on 12-07-16.
//  Copyright © 2016 Mark van Winden. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        var movie1 = Movie(movieImg: "", movieTitle: "The Lord of the Rings", movieOpinion: "Dit is de beste film ooit gemaakt.", movieUrl: "http://www.lotr.com/")
        var movie2 = Movie(movieImg: "", movieTitle: "Transformers", movieOpinion: "Leuke popcorn film.", movieUrl: "http://www.transformers.com/")
        movies.append(movie1)
        movies.append(movie2)
        
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            cell.configureCell(movie)
            return cell
        } else {
            let cell = MovieCell()
            cell.configureCell(movie)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    @IBAction func addBtnPressed(sender: UIButton) {
        performSegueWithIdentifier("AddVC", sender: nil)
//        let AddVC = storyboard?.instantiateViewControllerWithIdentifier("AddVC")
//        presentViewController(AddVC!, animated: true, completion: nil)
    }




}

