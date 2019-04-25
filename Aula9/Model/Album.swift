//
//  Album.swift
//  Aula9
//
//  Created by Ronaldo Tavares da Silva on 25/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class Album: NSObject {
    var id: Int = 0
    var title: String?
    
    init(json: [String: Any]) {
        id = json["id"] as? Int ?? 0
        title = json["title"] as? String
    }
    
    static func getAlbums(callback: @escaping (_ albums : [Album], _ error: Error?)->()) {
        
        API.getAlbums.request{albumsJSON, error in
            
            let albums = albumsJSON.compactMap { albumJSON in Album(json : albumJSON) }
            callback(albums, error)
        }
    }
}
