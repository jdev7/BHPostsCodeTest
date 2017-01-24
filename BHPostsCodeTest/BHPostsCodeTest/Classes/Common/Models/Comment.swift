//
//  Comment.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Gloss

//MARK: - RootClass
struct Comment: Glossy {
    
    let body : String!
    let email : String!
    let id : Int!
    let name : String!
    let postId : Int!
    
    
    
    //MARK: Decodable
    init?(json: JSON){
        body = "body" <~~ json
        email = "email" <~~ json
        id = "id" <~~ json
        name = "name" <~~ json
        postId = "postId" <~~ json
    }
    
    
    //MARK: Encodable
    func toJSON() -> JSON? {
        return jsonify([
            "body" ~~> body,
            "email" ~~> email,
            "id" ~~> id,
            "name" ~~> name,
            "postId" ~~> postId,
            ])
    }
    
    static func parseCommentsArray(object: AnyObject) -> [Comment]? {
        if let jsonArray = object as? [JSON] {
            return [Comment].from(jsonArray: jsonArray)
        }
        return nil
    }
    
}
