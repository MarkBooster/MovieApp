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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        DataService.instance.loadMovies()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMoviesLoaded:", name: "moviesLoaded", object: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedMovies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movie = DataService.instance.loadedMovies[indexPath.row]
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
    
    func onMoviesLoaded(notification: AnyObject) {
        tableView.reloadData()
        
    }




}

