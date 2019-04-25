//
//  Reader.swift
//  Aula3Sample
//
//  Created by Virtual Machine on 21/02/19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import Foundation
import UIKit

enum ReaderError: Error{
    case ivalidNameError
    case outOfStock
}

struct Item{
    let price : Int
    var count : Int
}

class Reader : NSObject{
    var itens = ["Minizinha" : Item(price: 59, count: 1),
                 "Minizinha Chip" : Item(price: 159, count: 2),
                 "Moderninha Plus" : Item(price: 259, count: 3),
                 "Moderninha Pro" : Item(price: 359, count: 4),
                 "Moderninha Smart" : Item(price: 759, count: 5)]
    
    func vend(itemName : String) throws{
        guard let item = itens[itemName] else{
            print("ReaderError.ivalidNameError")
            throw ReaderError.ivalidNameError
        }
        
        guard item.count > 0 else{
            print("ReaderError.outOfStock")
            throw ReaderError.outOfStock
        }
        
        var newItem = item
        newItem.count -= 1
        itens[itemName] = newItem
        
        print("\(itemName) selled")
    }
}
