//
//  ViewController.swift
//  Aula11
//
//  Created by Ronaldo Tavares da Silva on 28/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // String
        //UserDefaults.standard.set("Anand", forKey: "name")
        let name = UserDefaults.standard.string(forKey: "name")
        // Bool
        //UserDefaults.standard.set(true, forKey: "myBool")
        let myBool = UserDefaults.standard.bool(forKey: "myBool")
        // Dictionary
        //UserDefaults.standard.set([1, 2, 3, 4], forKey: "myArray")
        let myArray = UserDefaults.standard.array(forKey: "myArray") as? [Int] ?? []
        // Array
        //UserDefaults.standard.set(["name": "Matheus", "age": 27], forKey: "myDictionary")
        let myDictionary = UserDefaults.standard.value(forKey: "myDictionary") as? [String: Any] ?? [:]
        
        let user = User()
        user.email = "rndtavares@gmail.com"
        user.fullName = "Ronaldo Tavares da Silva"
        user.objectId = "1"
        user.password = "123456"
        user.token = "HASH"
        UserDefaults.standard.set(user.convertToDict(), forKey: "myUser")
        let myUser = UserDefaults.standard.value(forKey: "myUser") as? [String: Any] ?? [:]
        
        print(name)
        print(myBool)
        print(myArray)
        print(myDictionary)
        print(myUser)
    }


}

