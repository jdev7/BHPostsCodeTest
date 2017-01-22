//
//  PostListView.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

protocol PostListView: CommonViewMethods {
    var presenter: PostListEventHandler! { get set }
    
    func refreshPostsView()
}
