//
//  PostListInteractorOutput.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation

protocol PostListInteractorOutput: class {
    var interactor: PostListInteractorInput! { get set }
    
    func setPosts()
}
