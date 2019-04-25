//
//  User.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-21.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class User: Equatable, Hashable {
    var name: String?
    var email: String?
    var cards: [CreditCard] = []

    static func == (lhs: User, rhs: User) -> Bool {
        if lhs.name == rhs.name &&
            lhs.email == rhs.email {
            return true
        } else {
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(email)
    }
}
