//
//  CreditCard.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-21.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class CreditCard: Hashable, Equatable {

    var id: String
    var number: String

    init(withid id: String, andNumber number: String) {
        self.id = id
        self.number = number
    }

    static func == (lhs: CreditCard, rhs: CreditCard) -> Bool {
        if lhs.id == rhs.id {
            return true
        } else {
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
