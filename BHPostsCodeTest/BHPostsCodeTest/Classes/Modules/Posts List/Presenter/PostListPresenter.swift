//
//  PostListPresenter.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

class PostListPresenter: PostListEventHandler, PostListInteractorOutput {
    
    weak var view: PostListView!
    var interactor: PostListInteractorInput!
    
    func updateView() {
        
    }
}
