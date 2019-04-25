//
//  Player.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 28/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class Player: NSObject {
    
    var __type: String = ""
    var age: Int = 0
    var birthday: String = ""
    var className: String = ""
    var club: String = ""
    var createdAt: String = ""
    var images: [String] = []
    var name: String = ""
    var objectId: String = ""
    var order: Int = 0
    var position: String = ""
    var updatedAt: String = ""
    var team: Team?

    override init(){ }
    
    init(json: JSON){
        print(json)
        self.__type = json["__type"] as? String ?? ""
        self.age = json["age"] as? Int ?? 0
        self.birthday = json["birthday"] as? String ?? ""
        self.className = json["className"] as? String ?? ""
        self.club = json["club"] as? String ?? ""
        self.createdAt = json["createdAt"] as? String ?? ""
        self.images = json["images"] as? [String] ?? []
        self.name = json["name"] as? String ?? ""
        self.objectId = json["objectId"] as? String ?? ""
        self.order = json["order"] as? Int ?? 0
        self.position = json["position"] as? String ?? ""
        self.updatedAt = json["updatedAt"] as? String ?? ""
        self.team = Team(json: json["team"] as! JSON)
    }
    
    static func getPlayersBy(teamId: String, callback: @escaping (_ players : [Player], _ error: Error?)->()) {
        API.getPlayersBy(teamId: teamId).request{ playersJSON, error in
            if let array = playersJSON["results"] as? [JSON] {
                let players = array.compactMap{playersJSON in Player(json: playersJSON)}
                callback(players, error)
            }
        }
    }
    
    static func openPackage(callback: @escaping (_ players: [Player], _ error: Error?)->()) {
        API.openPackage.request{ playersJSON, error in
            if let array = playersJSON["result"] as? [JSON] {
                let players = array.compactMap{playersJSON in Player(json: playersJSON)}
                callback(players, error)
            }
        }
    }
}
