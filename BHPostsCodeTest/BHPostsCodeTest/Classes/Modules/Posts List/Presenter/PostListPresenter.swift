//
//  PostListPresenter.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

class PostListPresenter: PostListEventHandler {
    
    weak var view: PostListView!
    var interactor: PostListInteractorInput! { didSet { self.interactor.output = self } }
    var router: BHRouter!
    
    func updateView() {
        print("presenter updateViewCalled")
        interactor.loadPosts()
    }
}


extension PostListPresenter: PostListInteractorOutput {
    
    func setPosts() {
        print("presenter posts are set")
    }
}
