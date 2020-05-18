//
//  Todo.swift
//  SimpleTodoApp
//
//  Created by Cornerstone on 2020-05-17.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class Todo {
    var title: String
    var priority: Priority = .medium
    var isDone: Bool = false
    
    init(title:String, priority: Priority = .medium, isDone: Bool = false) {
        self.title = title
        self.priority = priority
        self.isDone = isDone
    }
}

enum Priority: Int, CaseIterable {
    case high = 0
    case medium = 1
    case low = 2
}
