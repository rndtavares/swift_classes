//
//  Person.swift
//  Aula2
//
//  Created by Matheus on 2019-02-18.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

@objc protocol PersonDelegate {
    @objc optional func updated(person: Person, atDate date: Date)
}

class Person: NSObject, ClassMaster {
    func timeFromLastUpdate() -> String? {
        guard let updatedAt = updatedAt else {
            return nil
        }
        
        let components = Calendar.current.dateComponents([.day, .minute, .hour], from: Date(), to: updatedAt)
        
        return "\(components.day ?? 0) dias, \(components.hour ?? 0) horas e \(components.minute ?? 0) minutos"
    }
    
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date? {
        didSet {
            guard let updatedAt = updatedAt else { return }
            delegate?.updated?(person: self, atDate: updatedAt)
        }
    }
    var name: String?
    weak var delegate: PersonDelegate?

    required override init() { }
    
    required init?(json: [String : Any]) {
        
        objectId = json["objectId"] as? String
        name = json["name"] as? String
    }
}
