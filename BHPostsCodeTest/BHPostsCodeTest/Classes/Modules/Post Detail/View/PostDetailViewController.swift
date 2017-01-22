//
//  PostDetailViewController.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    var presenter: PostDetailEventHandler!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Post detail")

    }

}

extension PostDetailViewController: PostDetailView {
    
    func showPostInfo(post: PostViewModel) {
     
    }
    
}
