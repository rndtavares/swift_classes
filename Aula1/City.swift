//
//  City.swift
//  Aula1
//
//  Created by Matheus on 2019-02-13.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class City: NSObject {

    let name: String
    private(set) var population = Population(men: 443000, women: 402032)
    var age: Int = 0 {
        willSet(newValue) {
            print("A variavel age vai ser \(newValue) e ela era \(age)")
        }
        didSet {
            if age < 0 {
                age = oldValue
            }
        }
    }
    var totalPopulation: Int {
        get {
            return population.men + population.women
        }
        set {
            setPopulation(men: newValue / 2, women: newValue / 2)
        }
    }
    var state: State?
    var foundationYear: Int? {
        let components = Calendar.current.component(.year, from: Date())
        return components - age
    }


    init(withName newName: String) {
        name = newName
        super.init()
    }

    func getWeather() -> Int {
        switch name {
        case "Porto Alegre":
            return 34
        case "São Paulo":
            return 24
        default:
            return 26
        }
    }
    
    private func setPopulation(men: Int, women: Int) {
        population.men = men
        population.women = women
    }
}
