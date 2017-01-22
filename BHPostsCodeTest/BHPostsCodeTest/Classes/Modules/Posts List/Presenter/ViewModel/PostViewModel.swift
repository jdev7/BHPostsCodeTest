//
//  PostViewModel.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

struct PostViewModel {
    var identifier: Int
    var title: String
    var body: String
    
    var authorId: Int
    var authorName: String
    
    var totalComments: Int
    
    init(identifier: Int, title: String, body: String, authorId: Int, authorName: String?, totalComments: Int) {
        self.identifier = identifier
        self.title = title
        self.body = body
        self.authorId = authorId
        self.authorName = authorName ?? "Anonymous user"
        self.totalComments = totalComments
    }
}
