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
        print("router initialized")
    }
    
    deinit {
        print("router DEINIT")
    }

    
    func navigateToMainWindow(window: UIWindow) {
        rootViewController = factory.instantiateViewController(of: .postList)
        window.rootViewController = rootViewController
    }
}
