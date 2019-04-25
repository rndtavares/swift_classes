//
//  Protocol.swift
//  Aula3Sample
//
//  Created by Virtual Machine on 21/02/19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import Foundation

public protocol ClassMaster: class {
    var objectId: String? { get set }
    var createdAt: Date? { get set }
    var updatedAt: Date? { get set }
    
    func selled() -> String?
    
    init?(json: [String: Any])
    init()
}
