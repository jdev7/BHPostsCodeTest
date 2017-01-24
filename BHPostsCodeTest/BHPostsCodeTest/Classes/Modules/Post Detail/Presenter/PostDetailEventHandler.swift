//
//  PostDetailEventHandler.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

protocol PostDetailEventHandler {
    var post: PostViewModel! { get set }
    weak var view: PostDetailView! { get set }
    
    func updateView()
    
}
