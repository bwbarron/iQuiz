//
//  ViewController.swift
//  iQuiz
//
//  Created by Barron, Brandon on 5/3/16.
//  Copyright © 2016 Barron, Brandon. All rights reserved.
//

import Foundation
import UIKit


class SubjectTableViewController: UITableViewController {
    
    let cellReuseId = "subject"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(SubjectViewCell.self, forCellReuseIdentifier: cellReuseId)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
}

