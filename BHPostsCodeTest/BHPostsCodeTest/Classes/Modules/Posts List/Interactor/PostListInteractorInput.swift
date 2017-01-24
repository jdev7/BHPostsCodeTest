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
    var diskDataStore: ReadDataStore & WriteDataStore!
    
    private var posts: [Post]!
    private var users: [User]!
    private var comments: [Comment]!
    
    func loadPosts() {
        if posts == nil {
            loadPostsFromDisk()
        }
        else {
            loadUsers()
        }
    }
    
    private func loadPostsFromDisk() {
        // load posts from disk and if no results or error, loadFromNetwork
        diskDataStore.getPosts(success: { (posts) in
            if posts.count > 0 {
                self.posts = posts
                self.loadUsers()
            }
            else {
                self.loadPostsFromNetwork()
            }
        }) { (error) in
            self.loadPostsFromNetwork()
        }
    }
    
    private func loadPostsFromNetwork() {
        networkDataStore.getPosts(success: { (posts) in
            self.posts = posts
            self.diskDataStore.savePostsInBackground(posts: posts)
            self.loadUsers()
            
        }) { (error) in
            self.output?.errorLoadingPosts(description: error.localizedDescription)
        }
    }
    
    private func loadUsers() {
        if users == nil {
            loadUsersFromDisk()
        }
        else {
            loadComments()
        }
    }
    
    private func loadUsersFromDisk() {
        // load users from disk and if no results or error, loadFromNetwork
        diskDataStore.getUsers(success: { (users) in
            if users.count > 0 {
                self.users = users
                self.loadComments()
            }
            else {
                self.loadUsersFromNetwork()
            }
        }) { (error) in
            self.loadUsersFromNetwork()
        }
    }
    
    private func loadUsersFromNetwork() {
        networkDataStore.getUsers(success: { (users) in
            self.users = users
            self.diskDataStore.saveUsersInBackground(users: users)
            self.loadComments()
            
        }) { (error) in
            self.output?.errorLoadingPosts(description: error.localizedDescription)
        }
    }
    
    private func loadComments() {
        if comments == nil {
            loadCommentsFromDisk()
        }
        else {
            preparePosts()
        }
    }
    
    private func loadCommentsFromDisk() {
        // load comments from disk and if no results or error, loadFromNetwork
        diskDataStore.getComments(success: { (comments) in
            if comments.count > 0 {
                self.comments = comments
                self.preparePosts()
            }
            else {
                self.loadCommentsFromNetwork()
            }
        }) { (error) in
            self.loadCommentsFromNetwork()
        }
    }
    
    private func loadCommentsFromNetwork() {
        networkDataStore.getComments(success: { (comments) in
            self.comments = comments
            self.diskDataStore.saveCommentsInBackground(comments: comments)
            self.preparePosts()
            
        }) { (error) in
            self.output?.errorLoadingPosts(description: error.localizedDescription)
        }
    }
    
    private func preparePosts() {
        
        DispatchQueue.global(qos: .background).async {
            let preparedPosts = self.posts.map { (post) -> PostViewModel in
                
                let userName = self.users.filter({ $0.id == post.userId }).first?.name
                let totalComments = self.comments.filter({ $0.postId == post.id }).count
                
                return PostViewModel(identifier: post.id, title: post.title, body: post.body, authorId: post.userId, authorName: userName, totalComments: totalComments)
            }
            
            DispatchQueue.main.async {
                self.output?.setPosts(posts: preparedPosts)
            }
        }
    }
}
