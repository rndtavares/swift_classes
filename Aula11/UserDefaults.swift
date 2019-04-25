//
//  UserDefaultDatabaseViewController.swift
//  Aula11
//
//  Created by Ronaldo Tavares da Silva on 28/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

private struct Key {
    static let currentUser = "currentUser"
}

class UserDefaultsDatabase {

    static let shared = UserDefaultsDatabase()
    private let userDefaults = UserDefaults.standard
    
    var currentUser: [String: Any]? {
        get {
            return UserDefaults.value(forKey: Key.currentUser) as? [String: Any]
        }
        set {
            UserDefaults.setValue(newValue, forKey: Key.currentUser)
        }
    }
}


