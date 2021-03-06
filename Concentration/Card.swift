//
//  Card.swift
//  Concentration
//
//  Created by Adolfo Onrubia on 3/2/18.
//  Copyright © 2018 Onrubia. All rights reserved.
//

import Foundation

struct  Card
{
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
