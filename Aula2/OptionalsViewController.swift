//
//  OptionalsViewController.swift
//  Aula2
//
//  Created by Matheus on 2019-02-14.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class Vehicle {
    var wheels:Int = 4
    var name:String?
}

class OptionalsViewController: UIViewController {
    
    var vehicle: Vehicle?
    var myVehicle: Any?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var name: String? = nil
        print(name)
        
        let nickname: String? = "matheusfrozzi"
        print(nickname)
        
//        let score:Int = nil
//        print(score)
        // vai dar erro no em build time
        
        let email:String? = "matheus@mocka.email"
        
        if email != nil {
            print(email!)
        }

        let car = Vehicle()
        print(car.wheels)
        print(car.name)
        
        car.name = "Maserati"
        print(car.name)

        let optionalUsername:String? = "bob42"
//        let optionalUsername:String? = nil
        
        if let username = optionalUsername {
            print(username)
            name = username
        }
        
        if  let name = name,
            let nickname = nickname,
            let email = email {
            
            print(name)
            print(nickname)
            print(email)
        }

        if name != nil && email != nil {
            print("Logging in user with username: \(name!)  \(email!)")
        }

        // Como esta usando opcional sem forçar, ele não vai dar crash, só vai falhar a operação e continuar
        vehicle?.name = "Gol"
        
//        vehicle!.name = "Gol" // Geraria crash no app
        
        vehicle = Vehicle()
        vehicle?.name = "Uno"
        
        print(vehicle?.name)
        print("---------------")
        print(vehicle!.name!)
        print(vehicle?.wheels)
        print(vehicle!.wheels)
        
        authenticate(username: nil, password: "123456")
        authenticate(username: "Ronaldo", password: "123456")

        myVehicle = Vehicle()

        if let isAVehicle = myVehicle as? Vehicle {
            isAVehicle.name = "ronaldo"
            print(isAVehicle.name)
            print(isAVehicle.name!)
            print(isAVehicle.wheels)
        }
    }
    
    func authenticate(username: String?, password:String?)
    {
        guard let username = username, let password = password else {
            print("username ou senha estão nil, não executara nada mais")
            return
        }
        
        print("username = \(username), password = \(password)")
    }
}
