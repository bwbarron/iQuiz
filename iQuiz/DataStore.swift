//
//  DataStore.swift
//  iQuiz
//
//  Created by Barron, Brandon on 5/7/16.
//  Copyright © 2016 Barron, Brandon. All rights reserved.
//

import Foundation

class DataStore {
    
    static let sharedData = DataStore()
    var data: NSData?
    let defaultsKey = "quizzes"
    
    let subjects = ["Science", "Marvel Super Heroes", "Mathematics"]
    let descriptions = [
        "Mathematics": "Do things with numbers",
        "Marvel Super Heroes": "Marvel > DC",
        "Science": "Blow stuff up"
    ]
    let images = [
        "Mathematics": "math.png",
        "Marvel Super Heroes": "marvel.png",
        "Science": "shine.png"
    ]
    
    
    init() {
        let defaults = NSUserDefaults.standardUserDefaults()
        data = defaults.objectForKey(defaultsKey) as? NSData
    }
    
    func retrieveData(request: NSURLRequest, cb: (NSData) -> Void) {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            let defaults = NSUserDefaults.standardUserDefaults()
            if error != nil {
                print("problem loading from URL, reading from local storage instead")
                self.data = defaults.objectForKey(self.defaultsKey) as? NSData
            } else {
                print("requesting data...")
                self.data = data//NSString(data: data!, encoding: NSASCIIStringEncoding)!
                defaults.setObject(self.data, forKey: self.defaultsKey) // store results locally
            }
            cb(self.data!)
        }
        task.resume()
    }
    
}

