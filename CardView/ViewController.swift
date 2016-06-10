//
//  ViewController.swift
//  CardView
//
//  Created by Duong Nguyen on 31/05/2016.
//  Copyright © 2016 Oliu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

protocol HideNavBarDelegate: class {
    func hideBar(controller: ViewController)
    func unhideBar(controller: ViewController)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // set up the array for the rows
    var episodes = [Episode]()
    // set root reference
    let rootRef = FIRDatabase.database().reference().child("Restaurants")
    var storageRef:FIRStorageReference!
    // set default episode/row
    var episode: Episode? = Episode(key: "", title: "", description: "", location: "", star: 0)
    
    weak var delegate: HideNavBarDelegate?
    var lastContentOffset: CGFloat = 0
    
    @IBOutlet var tableView: UITableView!
    var ep: Dictionary<String,AnyObject?> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // This is asynchronous firebase databse call.
        rootRef.observeEventType(.Value) { (snap: FIRDataSnapshot) in
            // loop through all the keys within the reference
            for child in snap.children {
                // create a new reference using the key
                let tempRef = self.rootRef.child(child.key!!)
                // create dictionary with the database
                tempRef.observeSingleEventOfType(.Value, withBlock: {(snap) in
                    self.ep = [
                        "title": snap.childSnapshotForPath("Title").value as? String,
                        "description": snap.childSnapshotForPath("Description").value as? String,
                        "location": snap.childSnapshotForPath("Location").value as? String,
                        "discount": snap.childSnapshotForPath("Discount").value as? String,
                        "star": (snap.childSnapshotForPath("Star").value as? NSNumber)?.integerValue,
                    ]
                    // add the database to an episode and append that episode to the array
                    self.episode = Episode(key: "", dictionary: self.ep)
                    self.episodes.append(self.episode!)
                    // reload the whole table
                    self.tableView.reloadData()
                })
            }
        }
        tableView.frame = self.view.bounds;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "cell", forIndexPath: indexPath) as! CustomCell
        cell.episode = episodes[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector(Selector("setSeparatorInset:")) {
            cell.separatorInset = UIEdgeInsetsZero
        }
        if cell.respondsToSelector(Selector("setPreservesSuperviewLayoutMargins:")) {
            cell.preservesSuperviewLayoutMargins = false
        }
        if cell.respondsToSelector(Selector("setLayoutMargins:")) {
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        delegate?.hideBar(self)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        delegate?.unhideBar(self)
    }
}

