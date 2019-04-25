//
//  ClosuresViewController.swift
//  Aula2
//
//  Created by Matheus on 2019-02-15.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class ClosuresViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let welcomeMessage = {(name:String) -> String in
            return "Seja bem vindo \(name)"
        }

        print(welcomeMessage("Matheus")) // Seja bem vindo Matheus
        
        
        var names = ["Jorge","Pedro","Alan","Gustavo","Bianca","Maria","Ana"]
        
        // Ordenar em ordem alfabética
        names.sort { (s1: String, s2: String) -> Bool in
            return s1 < s2
        }
        
        names.sort(by: {$0 < $1})

        print(names)
        //["Alan", "Ana", "Bianca", "Gustavo", "Jorge", "Maria", "Pedro"]
        
        
        let noParameterAndNoReturnValue = {
            print("Closure sem retorno e sem parâmetro!")
        }
        
        let noParameterAndReturnValue = { () -> Int in
            return 1000
        }
        
        let oneParameterAndReturnValue = { (x: Int) -> Int in
            return x % 10
        }
        
        let multipleParametersAndReturnValue = { (first: String, second: String) -> String in
            return first + " " + second
        }
        
        noParameterAndNoReturnValue()
        let valueInt = noParameterAndReturnValue()
        let valueInt2 = oneParameterAndReturnValue(5)
        let fullName = multipleParametersAndReturnValue("Matheus", "Frozzi")
        
        print(valueInt)
        print(valueInt2)
        print(fullName)
    }
}
