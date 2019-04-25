//
//  Team.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 28/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class Team: NSObject {
    
    var code: String = ""
    var color: String = ""
    var coverImage: File?
    var createdAt: String = ""
    var cresUrl: String = ""
    var flag: File?
    var name: String = ""
    var objectId: String = ""
    var updatedAt: String = ""
    
    override init(){ }
    
    init(json: JSON){
        self.code = json["code"] as? String ?? ""
        self.color = json["color"] as? String ?? ""
        self.coverImage = File(json: json["coverImage"] as! JSON)
        self.createdAt = json["createdAt"] as? String ?? ""
        self.cresUrl = json["cresUrl"] as? String ?? ""
        self.flag = File(json: json["flag"] as! JSON)
        self.name = json["name"] as? String ?? ""
        self.objectId = json["objectId"] as? String ?? ""
        self.updatedAt = json["updatedAt"] as? String ?? ""
    }
    
    static func getTeams(callback: @escaping (_ teams : [Team], _ error: Error?)->()) {
        
        API.getTeams.request{teamsJSON, error in
            if let array = teamsJSON["results"] as? [JSON] {
                let teams = array.compactMap { teamsJSON in Team(json : teamsJSON) }
                callback(teams, error)
            }
//            let teams = teamsJSON.compactMap {  }
//
        }
    }

}

class File: NSObject{
    var __type: String = ""
    var name: String = ""
    var url: String = ""
    
    override init(){ }
    
    init(json: JSON) {
        self.__type = json["__type"] as? String ?? ""
        self.name = json["name"] as? String ?? ""
        self.url = json["url"] as? String ?? ""
    }
}
