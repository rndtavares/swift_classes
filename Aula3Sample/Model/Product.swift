//
//  Product.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-21.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class Product: Hashable, Equatable {

    var id: String
    var name: String
    var stock: Int = 0

    init(withid id: String, andName name: String) {
        self.id = id
        self.name = name
    }

    static func == (lhs: Product, rhs: Product) -> Bool {
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
