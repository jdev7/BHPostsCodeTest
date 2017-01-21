//
//  PostListViewController.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController {
    
    var presenter: PostListEventHandler! { didSet { self.presenter.view = self } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateView()
    }
    
}

extension PostListViewController: PostListView {
    
    func showNoPostsView() {
        
    }
    
    func showPostsView() {
        
    }
}
