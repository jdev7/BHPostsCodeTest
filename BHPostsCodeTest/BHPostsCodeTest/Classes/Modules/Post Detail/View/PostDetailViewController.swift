//
//  PostDetailViewController.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    var presenter: PostDetailEventHandler! { didSet { self.presenter.view = self } }
    
    @IBOutlet fileprivate weak var lblTitle: UILabel!
    @IBOutlet fileprivate weak var lblAuthor: UILabel!
    @IBOutlet fileprivate weak var lblBody: UILabel!
    @IBOutlet fileprivate weak var lblComments: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(title: "Post detail")
        presenter.updateView()
    }

}

extension PostDetailViewController: PostDetailView {
    
    func showPostInfo(post: PostViewModel) {
        lblTitle.text = post.title.capitalized
        lblAuthor.text = "by \(post.authorName.uppercased())"
        lblBody.text = post.body.capitalized
        lblComments.text = "\(post.totalComments) users commented on this post"
    }
    
}
