//
//  Restaurant.swift
//  MyRestaurant
//
//  Created by Cornerstone on 2020-08-20.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

class Restaurant {
    let name: String
    let types: [Type]
    let priceRate: PriceRate
    let image: String?
    
    init(withName name: String, andTypes types: [Type], andPriceRate price: PriceRate = .Regular, andImage image :String? = nil ) {
        self.name = name
        self.types = types
        self.priceRate = price
        self.image = image
    }
}

enum Type : String, CaseIterable {
    case Brazilian
    case Mexican
    case Asian
    case Japanese
    case Korean
    case American
    case Italian
    case Breakfast
    case Lunch
    case Dinner
    case FastFood
}

enum PriceRate : String {
    case Creap = "$"
    case Regular = "$$"
    case Expensive = "$$$"
}

extension Restaurant {
    static func fetchAll() -> [Restaurant] {
        var list = [Restaurant]()
        for type in Type.allCases {
            let random = Int.random(in: 1...3)
            let priceRate: PriceRate = random > 2 ? .Expensive : random < 2 ? .Creap : .Regular
            list.append(Restaurant.init(withName: type.rawValue, andTypes: [type], andPriceRate: priceRate, andImage: "food"))
        }
        return list
    }
}
