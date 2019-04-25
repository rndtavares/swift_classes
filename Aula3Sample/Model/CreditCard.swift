//
//  CreditCard.swift
//  Aula3Sample
//
//  Created by Virtual Machine on 21/02/19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import Foundation
class CreditCard{
    let number : Int
    let expireDate : String
    let name : String
    let cv : Int
    
    init(number number:Int, expireDate expireDate:String, name name:String, cv cv:Int){
        self.number = number
        self.expireDate = expireDate
        self.name = name
        self.cv = cv
    }
}
