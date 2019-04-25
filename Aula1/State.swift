//
//  State.swift
//  Aula1
//
//  Created by Matheus on 2019-02-13.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class State {

    let name: String
    var country: String?
    
    init(withName newName: String) {
        name = newName
    }
    
    deinit {
        print("Classe State não existe mais")
    }
}
