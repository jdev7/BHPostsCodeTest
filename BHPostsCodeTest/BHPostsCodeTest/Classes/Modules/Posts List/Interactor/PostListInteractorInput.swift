//
//  PostListInteractorInput.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

protocol PostListInteractorInput {
    weak var output: PostListInteractorOutput? { get set }
    func loadPosts()
}


class PostListInteractor: PostListInteractorInput {
    weak var output: PostListInteractorOutput?
    
    func loadPosts() {
        print("Interactor loading posts")
        let posts = [
            PostViewModel(identifier: 0, title: "My post 0", authorId: 0, authorName: "Juan"),
            PostViewModel(identifier: 1, title: "My post 1", authorId: 0, authorName: "Juan"),
            PostViewModel(identifier: 2, title: "My post 2", authorId: 1, authorName: "Pepe"),
            PostViewModel(identifier: 3, title: "My post 3", authorId: 2, authorName: "Javier")
        ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.output?.setPosts(posts: posts)
        }
    }
}
