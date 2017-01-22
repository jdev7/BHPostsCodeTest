//
//  ReadDataStore.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

protocol ReadDataStore {
    func getPosts(success: @escaping ([Post]) -> (), error: @escaping (NSError) -> ())
    func getUsers(success: @escaping (_ users: [User])->(), error: @escaping (_ error: NSError)->())
    func getComments(success: @escaping (_ comments: [Comment])->(), error: @escaping (_ error: NSError)->())
}
