//
//  Usuario.swift
//  Aula3Sample
//
//  Created by Virtual Machine on 21/02/19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import Foundation
class Usuario: Equatable, Hashable{
    let name : String
    let email : String
    let id: String
    private var creditCard : CreditCard?
    
    init(name: String, email:String, id:String){
        self.name = name
        self.email = email
        self.id = id
    }
    
    static func == (lhs: Usuario, rhs: Usuario) -> Bool {
        if(lhs.name == rhs.name &&
            lhs.email == rhs.email &&
            lhs.id == rhs.id){
            return true;
        }else{
            return false;
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.email)
        hasher.combine(self.id)
    }
    
    func setCreditCard(creditCard : CreditCard){
        self.creditCard = creditCard
    }
}
