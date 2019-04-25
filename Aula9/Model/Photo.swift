//
//  Photo.swift
//  Aula9
//
//  Created by Ronaldo Tavares da Silva on 25/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class Photo: NSObject {
    var albumId: Int = 0
    var id: Int = 0
    var title: String?
    var url: String?
    var thumbnailUrl: String?
    
    
    init(json: [String: Any]) {
        albumId = json["albumId"] as? Int ?? 0
        id = json["id"] as? Int ?? 0
        title = json["title"] as? String
        url = json["url"] as? String
        thumbnailUrl = json["thumbnailUrl"] as? String
    }

    static func get(byAlbum id: Int, callback: @escaping (_ albums : [Photo], _ error: Error?) -> ()) {
        API.getAlbumsPhotos(albumId: id).request{ albumsJSON, error in
            let albums = albumsJSON.compactMap{ albumsJSON in Photo(json: albumsJSON)}
            callback(albums , error)
        }
    }
}
