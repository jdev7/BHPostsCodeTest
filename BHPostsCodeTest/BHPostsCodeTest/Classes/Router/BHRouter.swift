//
//  BHRouter.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

protocol BHRouter {
    func navigateToMainWindow(window: UIWindow)
    func navigateToPostsList()
    func navigateToPostsDetail(post: PostViewModel)
}
