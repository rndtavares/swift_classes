//
//  API.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 28/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

enum API{
    case getTeams
    case getPlayersBy(teamId:String)
    case openPackage
}

extension API{
    struct Constants {
        static let baseURL: String = "http://104.236.64.79:1337/parse/"
    }
    
    var path: String{
        switch self {
        case .getTeams:
            return "classes/Team?order=name"
        case .getPlayersBy(let teamId):
            let data: [String: Any] = [
                "team": [
                    "__type": "Pointer",
                    "className": "Team",
                    "objectId": teamId
                ]
            ]
            return "classes/Player?include=team&where=\(data.convertToJson() ?? "")"
        case .openPackage:
            return "functions/openPackage"
        }
    }

    var method: HTTPMethod {
        switch self {
            case .openPackage:
                return .post
            default:
                return .get
        }
    }
    
//    var url: String { return API.Constants.baseURL + path }
    var url: String {return API.Constants.baseURL + path}
    var urlEncoded: String { return url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""}
    
    func request(params: [String: Any] = [:], callback:@escaping (_ data : JSON, _ error: Error?)->()) {
        
        let header: HTTPHeaders = [
            "X-Parse-Application-Id": "873db802f1b24a8e8837206806fff4c6",
            "Content-Type": "application/json"
        ]
        
//        if let user = User.current, let token = user.token {
//            header["X-Parse-Session-Token"] = token
//        }
        
        let request = Alamofire.request(urlEncoded, method: method, parameters: nil, encoding: JSONEncoding.prettyPrinted, headers: header)
        
        request.validate().responseJSON { response in
            print("STATUS CODE: \(response.response?.statusCode ?? 0)")
            switch response.result {
            case .success:
                if let json = response.result.value as? JSON{
                    callback(json, response.error)
                }else{
                    callback([:], response.error)
                }
            case .failure(let error):
                callback([:], error)
            }
        }
    }
}

extension Dictionary {
    func convertToJson() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions(rawValue: 0))
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)
            return jsonString
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
