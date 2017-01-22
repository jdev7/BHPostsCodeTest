//
//  PostListViewController.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

class PostListViewController: UITableViewController {
    
    struct Constants {
        static let kPostListCellID = "postListCell"
        static let kNoPostsCellID = "noPostsCell"
    }
    
    var presenter: PostListEventHandler! { didSet { self.presenter.view = self } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter.updateView()
        setTitle(title: "Posts list")
        
    }
    
}

extension PostListViewController: PostListView {
    
    func refreshPostsView() {
        tableView.reloadData()
    }
}

extension PostListViewController {
    
    fileprivate func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = true
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfPosts > 0 ? presenter.numberOfPosts : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if presenter.numberOfPosts == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kNoPostsCellID, for: indexPath)
            
            cell.isUserInteractionEnabled = false
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kPostListCellID, for: indexPath) as! PostListTVCell
            
            cell.post = presenter.post(at: indexPath.row)
            
            return cell
        }
    }
}
