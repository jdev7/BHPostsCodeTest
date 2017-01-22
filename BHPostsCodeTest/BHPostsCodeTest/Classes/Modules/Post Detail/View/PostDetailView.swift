//
//  PostDetailView.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

protocol PostDetailView: CommonViewMethods {
    var presenter: PostDetailEventHandler! { get set }
    
    func showPostInfo(post: PostViewModel)
}
