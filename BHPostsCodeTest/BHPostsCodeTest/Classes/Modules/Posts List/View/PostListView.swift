//
//  PostListView.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

protocol PostListView: class {
    var presenter: PostListEventHandler! { get set }
    
    func showLoading()
    func stopLoading()
    
    func refreshPostsView()
    func showError(withMessage: String)
}


