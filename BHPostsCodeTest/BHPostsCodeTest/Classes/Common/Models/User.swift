//
//  User.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Gloss

//MARK: - User
struct User: Glossy {
    
    let address : Address!
    let company : Company!
    let email : String!
    let id : Int!
    let name : String!
    let phone : String!
    let username : String!
    let website : String!
    
    
    
    //MARK: Decodable
    init?(json: JSON){
        address = "address" <~~ json
        company = "company" <~~ json
        email = "email" <~~ json
        id = "id" <~~ json
        name = "name" <~~ json
        phone = "phone" <~~ json
        username = "username" <~~ json
        website = "website" <~~ json
    }
    
    
    //MARK: Encodable
    func toJSON() -> JSON? {
        return jsonify([
            "address" ~~> address,
            "company" ~~> company,
            "email" ~~> email,
            "id" ~~> id,
            "name" ~~> name,
            "phone" ~~> phone,
            "username" ~~> username,
            "website" ~~> website,
            ])
    }
    
    static func parseUsersArray(object: AnyObject) -> [User]? {
        if let jsonArray = object as? [JSON] {
            return [User].from(jsonArray: jsonArray)
        }
        return nil
    }
    
}

//MARK: - Company
struct Company: Glossy {
    
    let bs : String!
    let catchPhrase : String!
    let name : String!
    
    
    
    //MARK: Decodable
    init?(json: JSON){
        bs = "bs" <~~ json
        catchPhrase = "catchPhrase" <~~ json
        name = "name" <~~ json
    }
    
    
    //MARK: Encodable
    func toJSON() -> JSON? {
        return jsonify([
            "bs" ~~> bs,
            "catchPhrase" ~~> catchPhrase,
            "name" ~~> name,
            ])
    }
    
}

//MARK: - Addres
struct Address: Glossy {
    
    let city : String!
    let geo : Geo!
    let street : String!
    let suite : String!
    let zipcode : String!
    
    
    
    //MARK: Decodable
    init?(json: JSON){
        city = "city" <~~ json
        geo = "geo" <~~ json
        street = "street" <~~ json
        suite = "suite" <~~ json
        zipcode = "zipcode" <~~ json
    }
    
    
    //MARK: Encodable
    func toJSON() -> JSON? {
        return jsonify([
            "city" ~~> city,
            "geo" ~~> geo,
            "street" ~~> street,
            "suite" ~~> suite,
            "zipcode" ~~> zipcode,
            ])
    }
    
}

//MARK: - Geo
struct Geo: Glossy {
    
    let lat : String!
    let lng : String!
    
    
    
    //MARK: Decodable
    init?(json: JSON){
        lat = "lat" <~~ json
        lng = "lng" <~~ json
    }
    
    
    //MARK: Encodable
    func toJSON() -> JSON? {
        return jsonify([
            "lat" ~~> lat,
            "lng" ~~> lng,
            ])
    }
    
}
