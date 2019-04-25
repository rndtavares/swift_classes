//
//  ViewController.swift
//  Aula1
//
//  Created by Matheus on 2019-02-11.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        variaveis()
        tuplas()
        arrays()
        sets()
        dicionarios()
        iteracao()
        condicionais()
        quantosGraus(naCidade: "São Paulo")
        let estado = qualOstado("Porto Alegre")
        print(estado ?? "variavel estado está vazia")

        // Função retornando Tupla
        let meuEnderecoVar = meuEndereco()
        print(meuEnderecoVar.cidade)
        print(meuEnderecoVar.estado)
        
        contarAteZero(10)
        contarAteZero(-4)
        
        classStruct()
    }

    func variaveis() {
        // MARK: Variaveis e constantes
        var a = 1 // variavel
        let b = 1 // constante
        
        print(a)
        print(b)
        a = b
        // Iniciando uma variavel:
        let name = "Matheus Frozzi" // Isso vai ser automaticamente uma string

        // Tipando uma variável:
        let fullname: String = "Matheus Frozzi"
        print(name)
        print(fullname)

        // MARK: Opcionais
        var emptyValue: String?
        print(emptyValue)
        
        var maybeValue: String? = "Talvez tenha um valor aqui"
        print(maybeValue)
        
        // Force unwrap para forçar o desempacotamento, se a variavel for nil, o aplicativo apresentara uma exceção
        print(maybeValue!)
        
        // Optional Binding permite o desempacotamento e atribuição em um único comando
        if let value = emptyValue {
            print(value) // Não entrará aqui
        }
        
        emptyValue = "Setting value" // Colocando valor na variavel
        
        if let value = emptyValue {
            print(value) // Vai entrar aqui
        }
    }
    
    func tuplas() {
        // MARK: Tuplas
        let namelessTuple = (1, "bc")
        print(namelessTuple.0)
        
        // Dando nome aos valores
        let tuple = (name: "Matheus Frozzi", age: 26, city: "Porto Alegre")
        print(tuple.name)
    }
    
    func arrays() {
        // Criando um array vazio
        var someInts = [Int]()
        print("someInts is of type [Int] with \(someInts.count) items.")
        // Prints "someInts is of type [Int] with 0 items."
        
        someInts.append(3)
        // someInts now contains 1 value of type Int
        someInts = []
        // someInts is now an empty array, but is still of type [Int]
        
        // Creating an Array with an Array Literal
        var shoppingList2: [String] = ["Eggs", "Milk"]
        // shoppingList has been initialized with two initial items
        
        // Thanks to Swift’s type inference, you don’t have to write the type of the array if you’re initializing it with an array literal containing values of the same type. The initialization of shoppingList could have been written in a shorter form instead:
        var shoppingList = ["Eggs", "Milk"]
        
        // Accessing and Modifying an Array
        print("The shopping list contains \(shoppingList.count) items.")
        
        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        } else {
            print("The shopping list is not empty.")
        }
        // Prints "The shopping list is not empty."
        
        shoppingList.append("Flour")
        
        shoppingList += ["Baking Powder"]
        // shoppingList now contains 4 items
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        // shoppingList now contains 7 items
        
        var firstItem = shoppingList[0]
        print(firstItem)
        
        shoppingList[0] = "Six eggs"
        
        shoppingList[4...6] = ["Bananas", "Apples"]
        
        
        shoppingList.insert("Maple Syrup", at: 0)
        
        let mapleSyrup = shoppingList.remove(at: 0)
        print(mapleSyrup)
        // the item that was at index 0 has just been removed
        // shoppingList now contains 6 items, and no Maple Syrup
        // the mapleSyrup constant is now equal to the removed "Maple Syrup" string
        
        let apples = shoppingList.removeLast()
        
        
        // MARK: Iterating Over an Array
        for item in shoppingList {
            print(item)
        }
        // Six eggs
        // Milk
        // Flour
        // Baking Powder
        // Bananas
        
        // Getting the index of each item
        for (index, value) in shoppingList.enumerated() {
            print("Item \(index + 1): \(value)")
        }
        // Item 1: Six eggs
        // Item 2: Milk
        // Item 3: Flour
        // Item 4: Baking Powder
        // Item 5: Bananas
    }
    
    func sets() {
        // Sets
        // A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.
        
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        // Prints "letters is of type Set<Character> with 0 items."
        
        letters.insert("a")
        // letters now contains 1 value of type Character
        letters = []
        // letters is now an empty set, but is still of type Set<Character>
        
        // Creating a Set with an Array Literal
        var favoriteGenres2: Set<String> = ["Rock", "Classical", "Hip hop"]
        
        
        var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
        
        
        // Accessing and Modifying a Set
        print("I have \(favoriteGenres.count) favorite music genres.")
        if favoriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.")
        } else {
            print("I have particular music preferences.")
        }
        
        favoriteGenres.insert("Jazz")
        
        // Removendo item de um Set, ele retornara na funcão o item removido, se não encontrar o item, retornará nil
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
        } else {
            print("I never much cared for that.")
        }
        
        // Verificar se um set tem um item
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
        
        // Iterando no set
        for genre in favoriteGenres {
            print("\(genre)")
        }
        
        
        // Fundamental Set Operations
        
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
        
        oddDigits.union(evenDigits).sorted()
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        oddDigits.intersection(evenDigits).sorted()
        // []
        oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        // [1, 9]
        oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        // [1, 2, 9]
        
        
        // Set Membership and Equality
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        
        houseAnimals.isSubset(of: farmAnimals)
        // true
        farmAnimals.isSuperset(of: houseAnimals)
        // true
        farmAnimals.isDisjoint(with: cityAnimals)
        // true
    }
    
    func dicionarios() {
        // MARK: Dicionarios
        
        // Criando um dicionario vazio
        var namesOfIntegers = [Int: String]()
        
        namesOfIntegers[16] = "sixteen"
        // namesOfIntegers now contains 1 key-value pair
        namesOfIntegers = [:]
        // namesOfIntegers is once again an empty dictionary of type [Int: String]
        
        // Criando um dicionario literal
        var airports2: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        
        var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        
        // Acessando e modificando
        print("The airports dictionary contains \(airports.count) items.")
        
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        } else {
            print("The airports dictionary is not empty.")
        }
        // Prints "The airports dictionary is not empty."
        
        airports["LHR"] = "London"
        // the airports dictionary now contains 3 items
        
        airports["LHR"] = "London Heathrow"
        // the value for "LHR" has been changed to "London Heathrow"
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        // Prints "The old value for DUB was Dublin."
        
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).")
        } else {
            print("That airport is not in the airports dictionary.")
        }
        // Prints "The name of the airport is Dublin Airport."
        
        airports["APL"] = "Apple International"
        // "Apple International" is not the real airport for APL, so delete it
        airports["APL"] = nil
        // APL has now been removed from the dictionary
        
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        // Prints "The removed airport's name is Dublin Airport."
        
        // Iterando dicionario
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        
        
        // Prints "The removed airport's name is Dublin Airport."
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        // YYZ: Toronto Pearson
        // LHR: London Heathrow
        
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        // Airport code: YYZ
        // Airport code: LHR
        
        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        // Airport name: Toronto Pearson
        // Airport name: London Heathrow
        
        let airportCodes = [String](airports.keys)
        // airportCodes is ["YYZ", "LHR"]
        
        let airportNames = [String](airports.values)
        // airportNames is ["Toronto Pearson", "London Heathrow"]
    }
    
    func iteracao() {
        // MARK: Iterações
        
        // Intervalo exclusivo
        for i in 0..<10 {
            print(i)
        }
        
        // Intervalo inclusivo
        for i in 0...10 {
            print(i)
        }
    }
    
    func condicionais() {
        
        // MARK: Condicionais
        
        // Switch
        let city = "São Paulo"
        
        if city == "São Paulo" {
            print("Temperatura em \(city) é de 24 graus")
        } else if city == "Porto Alegre" {
            print("Temperatura em \(city) é de 40 graus")
        } else if city.hasSuffix("Paulo") {
            print("Temperatura em \(city) é de 20 graus")
        } else {
            print("O Brasil está no Verão")
        }

        switch city {
        case let x where x.hasSuffix("Paulo"):
            print("Temperatura em \(city) é de 20 graus")
            fallthrough
        case "São Paulo":
            print("Temperatura em \(city) é de 24 graus")
        case "Rio de Janeiro":
            print("Temperatura em são paulo é de 32 graus")
        case "Porto Alegre":
            print("Temperatura em \(city) é de 40 graus")
            fallthrough
        default:
            print("O Brasil está no Verão")
        }
    }
    
    func quantosGraus(naCidade cidade: String?, doEstado estado: String? = nil) {
        
        guard let cidade = cidade else {
            print("Nenhuma cidade recebida na função, cancela operação")
            return
        }

        print("Hello \(cidade)!")

        guard let estado = estado else {
            print("Não identificado o estado da cidade \(cidade)")
            return
        }

        print("\(cidade) fica no estado de \(estado).")
    }
    
    func qualOstado(_ cidade: String) -> String? {
        switch cidade {
        case "São Paulo":
            return "SP"
        case "Rio de Janeiro":
            return "RJ"
        case "Porto Alegre":
            return "RS"
        default:
            return nil
        }
    }
    
    func meuEndereco() -> (cidade: String, estado: String) {
        let cidade = "Porto Alegre"
        let estado = "Rio Grande do Sul"

        return (cidade, estado)
    }

    func contarAteZero(_ value: Int) {
        var currentValue = value
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        
        print("Counting to zero:")

        while currentValue != 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }

        print("zero!")
    }

    // Function Types as Return Types
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }

    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }

    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
    }
    
    func classStruct() {
        
        let city = City(withName: "Porto Alegre")
        city.age = 246
        city.state = State(withName: "RS")

        let city2 = city
        city2.age = 500

        print(city.age)
        print(city2.age)

        var population = city.population
        population.men = 900
        population.women = 901

        print(city.population)
        print(population)

        var state = city.state
        state?.country = "BR"

        print(state?.country)
        print(city.state?.country)
    }
}

