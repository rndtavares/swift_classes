//
//  ProtocolsViewController.swift
//  Aula2
//
//  Created by Matheus on 2019-02-15.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

class ProtocolsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PersonDelegate {

    var persons: [Person] = []
    var lightSwitch = OnOffSwitch.off

    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person()
        person.name = "Matheus"
        person.delegate = self
        
        person.updatedAt = Date()
        persons.append(person)

//        lightSwitch.toggle()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }

    func updated(person: Person, atDate date: Date) {
        
        print(person.name)
        print(person.objectId)
        print(person.createdAt)
        print(person.updatedAt)
        print(person.timeFromLastUpdate())
        print(date)
        
    }
}
