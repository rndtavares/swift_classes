//
//  Posts.swift
//  Aula9
//
//  Created by Ronaldo Tavares da Silva on 25/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import Foundation
class Post{
    var userID: Int = 0
    var id: Int = 0
    var title: String?
    var body: String?
    
    init(json: [String: Any]){
        userID = json["userID"] as? Int ?? 0
        id = json["id"] as? Int ?? 0
        title = json["title"] as? String
        body = json["body"] as? String
    }
    
    static func getPosts(callback: @escaping (_ posts : [Post], _ error: Error?)->()) {
        API.getPosts.request{ postsJSON, error in
            let posts = postsJSON.compactMap { postsJSON in Post(json: postsJSON)}
            callback(posts, error)
        }
    }
}
