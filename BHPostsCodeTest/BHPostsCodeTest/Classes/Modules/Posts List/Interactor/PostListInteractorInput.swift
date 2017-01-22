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
        else {
            loadUsers()
        }
    }
    
    private func loadPostsFromDisk() {
        // TODO: load posts from disk and if no results, loadFromNetwork
        loadPostsFromNetwork()
    }
    
    private func loadPostsFromNetwork() {
        networkDataStore.getPosts(success: { (posts) in
            self.posts = posts
            // TODO: save Posts from network to Disk
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
        // TODO: load users from disk and if no results, loadFromNetwork
        loadUsersFromNetwork()
    }
    
    private func loadUsersFromNetwork() {
        networkDataStore.getUsers(success: { (users) in
            self.users = users
            // TODO: save Users from network to Disk
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
        // TODO: load comments from disk and if no results, loadFromNetwork
        loadCommentsFromNetwork()
    }
    
    private func loadCommentsFromNetwork() {
        networkDataStore.getComments(success: { (comments) in
            self.comments = comments
            // TODO: save comments from network to Disk
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
