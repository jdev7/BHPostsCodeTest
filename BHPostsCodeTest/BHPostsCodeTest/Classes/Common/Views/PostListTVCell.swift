//
//  PostListTVCell.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

class PostListTVCell: UITableViewCell {
    
    var post: PostViewModel! { didSet { self.setupInfo() } }

    @IBOutlet fileprivate weak var lblTitle: UILabel!
    @IBOutlet fileprivate weak var lblAuthor: UILabel!
    
    func setupInfo() {
        lblTitle.text = post.title
        lblAuthor.text = post.authorName
    }
}
