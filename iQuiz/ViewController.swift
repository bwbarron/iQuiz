//
//  ViewController.swift
//  iQuiz
//
//  Created by Barron, Brandon on 5/7/16.
//  Copyright © 2016 Barron, Brandon. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var subjTableView: UITableView!
    
    let dataStore = DataStore.sharedData
    let cellReuseId = "subject"
    let defaultURL = "http://tednewardsandbox.site44.com/questions.json"
    
    var data: AnyObject = []
    var selected = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjTableView.delegate = self
        subjTableView.dataSource = self
        
        self.getData(defaultURL)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataStore.subjects.count
        //return self.data.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseId) as! SubjectViewCell
        let subj = dataStore.subjects[indexPath.row]
        cell.title.text = subj
        cell.desc.text = dataStore.descriptions[subj]
        cell.icon.image = UIImage(named: dataStore.images[subj]!)
//        let quiz = self.data[indexPath.row]
//        cell.title.text = quiz["title"] as? String
//        cell.desc.text = quiz["desc"] as? String
//        cell.icon.image = UIImage(named: dataStore.images[quiz["title"] as! String]!)
        
        return cell
    }
    
    @IBAction func settingsClicked(sender: AnyObject) {
        // create alert controller and text field
        let alert = UIAlertController(title: "Settings",
                                      message: "Choose where to download questions from",
                                      preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in textField.placeholder = "URL" }
        
        // create action to retrieve data from specified URL
        let retrieveAction = UIAlertAction(title: "Check now", style: .Default) { _ in
            let urlField = alert.textFields![0] as UITextField
            self.getData(urlField.text!)
            self.subjTableView.reloadData()
        }
        alert.addAction(retrieveAction)
        
        // create action to retrieve data from default URL
        let retrieveDefaultAction = UIAlertAction(title: "Use default URL", style: .Default) { _ in
            self.getData(self.defaultURL)
            self.subjTableView.reloadData()
        }
        alert.addAction(retrieveDefaultAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func getData(url: String) {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        dataStore.retrieveData(request) { data in
            do {
                self.data = try NSJSONSerialization.JSONObjectWithData(
                    data,
                    options: .AllowFragments)
            } catch {
                print(error)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! QuestionController
        controller.data = self.data[(subjTableView.indexPathForSelectedRow?.row)!]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
