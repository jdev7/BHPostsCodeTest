//
//  PostListInteractorInput.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

protocol PostListInteractorInput {
    weak var output: PostListInteractorOutput? { get set }
    func loadPosts()
}


class PostListInteractor: PostListInteractorInput {
    weak var output: PostListInteractorOutput?
    var networkDataStore: ReadDataStore!
    
    private var posts: [Post]!
    private var users: [User]!
    private var comments: [Comment]!
    
    func loadPosts() {
        if posts == nil {
            loadPostsFromDisk()
            
        }
    }
    
    private func loadPostsFromDisk() {
        // if no results, loadFromNetwork
        loadPostsFromNetwork()
    }
    
    private func loadPostsFromNetwork() {
        networkDataStore.getPosts(success: { (posts) in
            self.posts = posts
            // save Posts from network to Disk
            self.loadUsers()
            
        }) { (error) in
            self.output?.errorLoadingPosts(description: error.localizedDescription)
        }
    }
    
    private func loadUsers() {
        if users == nil {
            loadUsersFromDisk()
        }
    }
    
    private func loadUsersFromDisk() {
        // if no results, loadFromNetwork
        loadUsersFromNetwork()
    }
    
    private func loadUsersFromNetwork() {
        networkDataStore.getUsers(success: { (users) in
            self.users = users
            // save Users from network to Disk
            self.preparePosts()
            
        }) { (error) in
            self.output?.errorLoadingPosts(description: error.localizedDescription)
        }
    }
    
    private func loadComments() {
        if comments == nil {
            loadCommentsFromDisk()
        }
    }
    
    private func loadCommentsFromDisk() {
        // if no results, loadFromNetwork
        loadCommentsFromNetwork()
    }
    
    private func loadCommentsFromNetwork() {
        networkDataStore.getComments(success: { (comments) in
            self.comments = comments
            // save comments from network to Disk
            self.preparePosts()
            
        }) { (error) in
            self.output?.errorLoadingPosts(description: error.localizedDescription)
        }
    }
    
    private func preparePosts() {
        let preparedPosts = posts.map { (post) -> PostViewModel in
            let userName = users.filter({ $0.id == post.userId }).first?.name
            
            return PostViewModel(identifier: post.id, title: post.title, authorId: post.userId, authorName: userName)
        }
        self.output?.setPosts(posts: preparedPosts)
    }
}
