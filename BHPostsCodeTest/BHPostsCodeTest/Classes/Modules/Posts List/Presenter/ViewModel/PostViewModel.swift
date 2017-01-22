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
    
    var authorId: Int
    var authorName: String
    
    init(identifier: Int, title: String, authorId: Int, authorName: String?) {
        self.identifier = identifier
        self.title = title
        self.authorId = authorId
        self.authorName = authorName ?? "Anonymous user"
    }
}
