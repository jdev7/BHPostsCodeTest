//
//  WriteDataStore.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 23/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

protocol WriteDataStore {
    func savePostsInBackground(posts: [Post])
    func saveUsersInBackground(users: [User])
    func saveCommentsInBackground(comments: [Comment])
}
