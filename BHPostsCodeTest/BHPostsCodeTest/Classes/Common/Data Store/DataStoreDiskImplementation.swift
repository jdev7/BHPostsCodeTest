//
//  DataStoreDiskImplementation.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 24/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import SugarRecord

class DataStoreDiskImplementation: ReadDataStore, WriteDataStore {
    
    lazy var coreDataStorage: CoreDataDefaultStorage = {
        let store = CoreDataStore.named("BHDataModel")
        let bundle = Bundle(for: type(of: self))
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        
        return defaultStorage
    }()
    
    func getPosts(success: @escaping ([Post]) -> (), error: @escaping (NSError) -> ()) {
        DispatchQueue.global(qos: .background).async {
            do {
                let cdposts: [CDPost] = try self.coreDataStorage.saveContext.fetch(FetchRequest<CDPost>().sorted(with: "id", ascending: true))
                let posts: [Post] = cdposts.map({ Post(json: $0.toDictionary() as! [String: Any])! })
                DispatchQueue.main.async {
                    success(posts)
                }
            }
            catch let cdError as NSError {
                DispatchQueue.main.async {
                    error(cdError)
                }
            }
        }
    }
    
    func getUsers(success: @escaping (_ users: [User])->(), error: @escaping (_ error: NSError)->()) {
        DispatchQueue.global(qos: .background).async {
            do {
                let cdUsers: [CDUser] = try self.coreDataStorage.saveContext.fetch(FetchRequest<CDUser>().sorted(with: "id", ascending: true))
                let users: [User] = cdUsers.map({ User(json: $0.toDictionary() as! [String: Any])! })
                DispatchQueue.main.async {
                    success(users)
                }
            }
            catch let cdError as NSError {
                DispatchQueue.main.async {
                    error(cdError)
                }
            }
        }
    }
    
    func getComments(success: @escaping (_ comments: [Comment])->(), error: @escaping (_ error: NSError)->()) {
        DispatchQueue.global(qos: .background).async {
            do {
                let cdComments: [CDComment] = try self.coreDataStorage.saveContext.fetch(FetchRequest<CDComment>().sorted(with: "id", ascending: true))
                let comments: [Comment] = cdComments.map({ Comment(json: $0.toDictionary() as! [String: Any])! })
                DispatchQueue.main.async {
                    success(comments)
                }
            }
            catch let cdError as NSError {
                DispatchQueue.main.async {
                    error(cdError)
                }
            }
        }
    }
    
    func savePostsInBackground(posts: [Post]) {
        try! coreDataStorage.operation { (context, save) -> Void in
            posts.forEach({ (post) in
                let cdpost: CDPost = try! context.new()
                cdpost.bind(withPost: post)
            })
            save()
        }
    }
    
    func saveUsersInBackground(users: [User]) {
        try! coreDataStorage.operation { (context, save) -> Void in
            users.forEach({ (user) in
                let cdUser: CDUser = try! context.new()
                cdUser.bind(withUser: user, context: context)
            })
            save()
        }
    }
    
    func saveCommentsInBackground(comments: [Comment]) {
        try! coreDataStorage.operation { (context, save) -> Void in
            comments.forEach({ (comment) in
                let cdComment: CDComment = try! context.new()
                cdComment.bind(withComment: comment)
            })
            save()
        }
    }
}
