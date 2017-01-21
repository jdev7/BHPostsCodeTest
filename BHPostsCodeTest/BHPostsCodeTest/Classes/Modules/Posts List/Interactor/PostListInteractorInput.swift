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
        self.output?.setPosts()
    }
}
