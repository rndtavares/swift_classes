//
//  API.swift
//  Aula9
//
//  Created by Ronaldo Tavares da Silva on 25/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

enum API{
    case getPosts
    case getPostsComments(postID: Int)
    case getAlbums
    case getAlbumsPhotos(albumId: Int)
}

extension API{
    
    struct Constants {
        static let baseURL: String = "https://jsonplaceholder.typicode.com/"
    }
    
    var path: String{
        switch self {
        case .getAlbums:
            return "albums"
        case .getAlbumsPhotos(let id):
            return "albums/\(id)/photos"
        case .getPosts:
            return "posts"
        case .getPostsComments(let id):
            return "posts/\(id)/comments"
        }
    }
    
    var url: String { return API.Constants.baseURL + path }
    
    
    var method: HTTPMethod {
        switch self {
//        case .newPost:
//            return .post
        default:
            return .get
        }
    }
    
    func request(params: [String: Any] = [:], callback:@escaping (_ data : [[String: Any]], _ error: Error?)->()) {
        
        let request = Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.prettyPrinted, headers: [:])
        
        request.validate().responseJSON { response in
            print("STATUS CODE: \(response.response?.statusCode ?? 0)")
            switch response.result {
            case .success:
                if let json = response.result.value as? [[String: Any]]{
                    callback(json, response.error)
                }else{
                    callback([], response.error)
                }
            case .failure(let error):
                callback([], error)
            }
        }
    }
}
