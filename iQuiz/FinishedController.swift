//
//  FinishedController.swift
//  iQuiz
//
//  Created by Barron, Brandon on 5/15/16.
//  Copyright © 2016 Barron, Brandon. All rights reserved.
//

import Foundation
import UIKit


class FinishedController: UIViewController {
    
    var data: AnyObject = []
    var score = 0
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionCount = (data["questions"] as! [AnyObject]).count
        statusLabel.text = questionCount - score == 0 ?
            "Perfect!" : "Could have been better"
        scoreLabel.text = "Your Score: \(score) / \(questionCount)"
    }
    
}
