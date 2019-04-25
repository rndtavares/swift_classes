//
//  User.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 28/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit
typealias JSON = [String:Any]

class User: NSObject {
    var objectId: String = "0"
    var fullName: String = ""
    var email: String = ""
    var password: String = ""
    var token: String? = nil
    
    static var current: User? {
        get {
            if let user = UserDefaultsDatabase.shared.currentUser {
                return User(json: user)
            } else {
                return nil
            }
        }
        set {
            if let newValue = newValue {
                UserDefaultsDatabase.shared.currentUser = newValue.convertToDict()
            }else{
                UserDefaultsDatabase.shared.currentUser = nil
            }
        }
    }
    
    override init(){ }
    
    init(json: JSON){
        self.objectId = json["objectId"] as? String ?? "0"
        self.fullName = json["fullName"] as? String ?? ""
        self.email = json["email"] as? String ?? ""
        self.token = json["id"] as? String ?? nil
    }
    
    func convertToDict() -> JSON {
        var dict: JSON = [:]
        dict["objectId"] = self.objectId
        dict["fullName"] = self.fullName
        dict["email"] = self.email
        
        if token != nil {
            dict["token"] = self.token!
        }
        
        return dict
    }
}

