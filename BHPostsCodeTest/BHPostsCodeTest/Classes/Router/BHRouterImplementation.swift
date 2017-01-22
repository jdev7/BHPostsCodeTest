//
//  BHRouterImplementation.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 20/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

class BHRouterImplementation: BHRouter {
    
    let factory: ViewControllerFactory
    private var rootViewController: UIViewController?
    
    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
    
    func navigateToMainWindow(window: UIWindow) {
        rootViewController = factory.instantiateViewController(of: .main)
        window.rootViewController = rootViewController
    }
    
    func navigateToPostsList() {
        let vc = factory.instantiateViewController(of: .postList)
        self.rootViewController?.show(vc, sender: self)
    }
    
    func navigateToPostsDetail(post: PostViewModel) {
        let vc = factory.instantiateViewController(of: .postDetail)
        let view = vc as! PostDetailView
        var eventHandler = view.presenter
        eventHandler?.post = post
        self.rootViewController?.show(vc, sender: self)
    }
}
