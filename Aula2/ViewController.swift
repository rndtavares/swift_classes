//
//  ViewController.swift
//  Aula2
//
//  Created by Matheus on 2019-02-13.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }

    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }

    enum Beverage: CaseIterable {
        case coffee, tea, juice
    }

    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }

    enum Country: Int {
        case brazil = 2, canada, italy, chile
    }
    
    enum State: String {
        case rs, sp, rj, pr = "Paraná"
    }
    
    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
        case division(ArithmeticExpression, ArithmeticExpression)
    }

    var directionToHead = CompassPoint.west
    var somePlanet: Planet = .earth
    var productBarcode = Barcode.upc(8, 85909, 51226, 3)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Ronaldo Enum")
        
        var barcodeUpc = Barcode.upc(1, 2, 3, 4)
        var barcodeQr = Barcode.qrCode("qr ronaldo")
        
        print(barcodeUpc)
        print(barcodeQr)
        
        var arithmetic = ArithmeticExpression.number(5)

        directionToHead = .east
    
        verificandoComSwitch()
        verificandoComSwitch2()
        enumIterativo()
        enumValoresAssociados()
        enumRawValue()
        enumRecursivo()
    }

    func verificandoComSwitch() {
        switch directionToHead {
        case .north:
            print("Lots of planets have a north") // (5 + 4) * 2
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
    }
    
    func verificandoComSwitch2() {

        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
    }

    func enumIterativo() {
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        
        for beverage in Beverage.allCases {
            print(beverage)
        }
    }
    
    func enumValoresAssociados() {

//        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

        switch productBarcode {
        case .upc(let numberSystem, let manufacturer, let product, let check):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
        case .qrCode(let productCode):
            print("QR code: \(productCode).")
        }
    }
    
    func enumRawValue() {
        let countryOrder = Country.canada.rawValue
        print(countryOrder)
        
        let state = State.rs.rawValue
        print(state)

        let possibleCountry = Country(rawValue: 5)
        print(possibleCountry)

        let positionToFind = 2
        if let someCountry = Country(rawValue: positionToFind) {
            switch someCountry {
            case .brazil:
                print("Mostly sunny")
            default:
                print("Far from home")
            }
        } else {
            print("There isn't a country at position \(positionToFind)")
        }
    }
    
    func enumRecursivo() {
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

        print(evaluate(product))
        
        let two = ArithmeticExpression.number(2)
        let eighteen = ArithmeticExpression.number(18)
        let division = ArithmeticExpression.division(eighteen, two)
        
        print(evaluate(division))
    }
    
    
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        case let .division(left, right):
            return evaluate(left) / evaluate(right)
        }
    }
}

