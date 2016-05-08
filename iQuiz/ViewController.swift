//
//  ViewController.swift
//  iQuiz
//
//  Created by Barron, Brandon on 5/7/16.
//  Copyright © 2016 Barron, Brandon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var subjTableView: UITableView!
    
    let data = DataStore.sharedData
    let cellReuseId = "subject"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjTableView.delegate = self
        subjTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.subjects.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseId) as! SubjectViewCell
        let subj = data.subjects[indexPath.row]
        cell.title.text = subj
        cell.desc.text = data.descriptions[subj]
        cell.icon.image = UIImage(named: data.images[subj]!)
        
        return cell
    }
    
    @IBAction func settingsClicked(sender: AnyObject) {
        let alert = UIAlertController(title: "Settings go here", message: "They'll be here eventually", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
