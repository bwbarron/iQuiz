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
    
    let subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
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
    
}

