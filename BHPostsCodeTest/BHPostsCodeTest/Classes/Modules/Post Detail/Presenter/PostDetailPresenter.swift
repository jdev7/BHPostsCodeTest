//
//  PostDetailPresenter.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

class PostDetailPresenter {
    weak var view: PostDetailView!
    var post: PostViewModel!
}

extension PostDetailPresenter: PostDetailEventHandler {
    
    func updateView() {
        view.showPostInfo(post: post)
    }
    
}
