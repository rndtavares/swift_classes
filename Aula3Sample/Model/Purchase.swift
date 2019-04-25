//
//  History.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-21.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

enum PurchaseError: Error {
    case noUserSelected
    case noCreditCard
    case noProductSelected
}

enum PurchaseStatus: String {
    case success = "Concluida"
    case canceled
    case error = "Erro"
    case pending
}

class Purchase: Hashable, Equatable {
    let user: User
    let date: Date
    let product: Product
    let card: CreditCard
    var status: PurchaseStatus = .pending

    init(user: User?, date: Date, product: Product?, card: CreditCard?) throws {
        guard let user = user else {
            throw PurchaseError.noUserSelected
        }
        
        guard let product = product else {
            throw PurchaseError.noProductSelected
        }

        guard let card = card else {
            throw PurchaseError.noCreditCard
        }

        self.card = card
        self.user = user
        self.date = date
        self.product = product
    }

    func finishPurchase(closure: @escaping (_ purchase: Purchase?, _ success: Bool)->()) {

        if product.stock > 0 {
            self.status = .success
            closure(self, true)
        } else {
            self.status = .error
            closure(self, false)
        }
    }

    static func == (lhs: Purchase, rhs: Purchase) -> Bool {
        if lhs.user == rhs.user &&
            lhs.date == rhs.date &&
            lhs.product == rhs.product {
            return true
        } else {
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
        hasher.combine(date)
        hasher.combine(product)
    }
}
