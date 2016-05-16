//
//  QuestionController.swift
//  iQuiz
//
//  Created by Barron, Brandon on 5/15/16.
//  Copyright © 2016 Barron, Brandon. All rights reserved.
//

import Foundation
import UIKit


class QuestionController: UIViewController {
    
    var data: AnyObject = []
    var correct = false
    var score = 0
    var qIdx = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = self.data["questions"]!![self.qIdx] as! [String : AnyObject]
        questionLabel.text = question["text"] as? String
        
        b1.setTitle(question["answers"]![0] as? String, forState: .Normal)
        b1.addTarget(self, action: #selector(self.choose), forControlEvents: .TouchUpInside)
        b2.setTitle(question["answers"]![1] as? String, forState: .Normal)
        b2.addTarget(self, action: #selector(self.choose), forControlEvents: .TouchUpInside)
        b3.setTitle(question["answers"]![2] as? String, forState: .Normal)
        b3.addTarget(self, action: #selector(self.choose), forControlEvents: .TouchUpInside)
        b4.setTitle(question["answers"]![3] as? String, forState: .Normal)
        b4.addTarget(self, action: #selector(self.choose), forControlEvents: .TouchUpInside)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! AnswerController
        controller.data = self.data
        controller.correct = self.correct
        controller.score = self.score
        controller.qIdx = self.qIdx
    }
    
    func choose(sender: UIButton) {
        var selected = 0
        
        if sender == b1 { selected = 1 }
        else if sender == b2 { selected = 2 }
        else if sender == b3 { selected = 3 }
        else { selected = 4 }
        
        if selected == Int(data["questions"]!![self.qIdx]["answer"] as! String) {
            self.score += 1
            self.correct = true
        }
        
        self.performSegueWithIdentifier("AnswerSelect", sender: self)
    }
    
}
