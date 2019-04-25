//
//  Protocols.swift
//  Aula2
//
//  Created by Matheus on 2019-02-18.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

public protocol ClassMaster: class {
    var objectId: String? { get set }
    var createdAt: Date? { get set }
    var updatedAt: Date? { get set }
    
    func timeFromLastUpdate() -> String?
    
    init?(json: [String: Any])
    init()
}

protocol Togglable {
    mutating func toggle()
}
