//
//  Post.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Gloss

//MARK: - Post
struct Post: Glossy {
    
    let body : String!
    let id : Int!
    let title : String!
    let userId : Int!
    
    
    //MARK: Decodable
    init?(json: JSON){
        body = "body" <~~ json
        id = "id" <~~ json
        title = "title" <~~ json
        userId = "userId" <~~ json
    }
    
    
    //MARK: Encodable
    func toJSON() -> JSON? {
        return jsonify([
            "body" ~~> body,
            "id" ~~> id,
            "title" ~~> title,
            "userId" ~~> userId,
            ])
    }
    
    static func parsePostsArray(object: AnyObject) -> [Post]? {
        if let jsonArray = object as? [JSON] {
            return [Post].from(jsonArray: jsonArray)
        }
        return nil
    }
    
}
