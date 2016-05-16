//
//  AnswerController.swift
//  iQuiz
//
//  Created by Barron, Brandon on 5/15/16.
//  Copyright © 2016 Barron, Brandon. All rights reserved.
//

import Foundation
import UIKit


class AnswerController: UIViewController {
    
    var data: AnyObject = []
    var correct = false
    var score = 0
    var qIdx = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = self.data["questions"]!![self.qIdx] as! [String : AnyObject]
        let ans = question["answers"]![Int(data["questions"]!![self.qIdx]["answer"] as! String)! - 1] as! String
        questionLabel.text = question["text"] as? String
        correctLabel.text = self.correct ? "Correct!" : "You tried"
        answerLabel.text = "Correct Answer: \(ans)"
        nextBtn.addTarget(self, action: #selector(self.next), forControlEvents: .TouchUpInside)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NextQuestion" {
            // proceed to next question
            let controller = segue.destinationViewController as! QuestionController
            controller.data = self.data
            controller.score = self.score
            controller.qIdx = self.qIdx + 1
        } else {
            // finished with quiz
            let controller = segue.destinationViewController as! FinishedController
            controller.data = self.data
            controller.score = self.score
        }
    }
    
    func next() {
        let identifier = (data["questions"] as! [AnyObject]).count - 1 == self.qIdx ?
            "FinishedQuiz" : "NextQuestion"
        self.performSegueWithIdentifier(identifier, sender: self)
    }
    
}
