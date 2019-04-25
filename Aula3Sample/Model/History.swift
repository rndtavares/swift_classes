//
//  History.swift
//  Aula3Sample
//
//  Created by Virtual Machine on 21/02/19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import Foundation

enum PurchaseStatus :String{
    case pending
    case done
    case denied
    case canceled
}

class History{
    let name: String
    var status: PurchaseStatus = .pending
    
    init(name: String){
        self.name = name
    }
}
