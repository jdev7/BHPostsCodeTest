//
//  PostListPresenter.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

class PostListPresenter {
    
    weak var view: PostListView!
    var interactor: PostListInteractorInput! { didSet { self.interactor.output = self } }
    var router: BHRouter!
    
    fileprivate var posts: [PostViewModel]!
    
}

extension PostListPresenter: PostListEventHandler {
    
    var numberOfPosts: Int {
        return posts?.count ?? 0
    }
        
    func updateView() {
        print("presenter updateViewCalled")
        view.showLoading()
        interactor.loadPosts()
    }
    
    
    func post(at index: Int) -> PostViewModel {
        return posts[index]
    }
    
    func didSelectPost(at index: Int) {
        print("post: \(posts[index].identifier) selected")
    }
}


extension PostListPresenter: PostListInteractorOutput {
    
    func setPosts(posts: [PostViewModel]) {
        self.posts = posts
        view.refreshPostsView()
        view.stopLoading()
    }
}
