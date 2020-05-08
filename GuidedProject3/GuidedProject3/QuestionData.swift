//
//  QuestionData.swift
//  GuidedProject3
//
//  Created by Cornerstone on 2020-05-08.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

struct Answer{
    var text: String
    var type: AnimalType
}

enum ResponseType{
    case single, multiple, ranged
}

enum AnimalType: Character{
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String{
        switch self {
        case .cat:
            return "You are incredibly outgoing. You surround with the people you love and enjoy with your friends."
        case .dog:
            return "Mischievous, yet mild-tempered, you enjoy things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you on the details. Slow and steady wins the race."
        }
    }
}
