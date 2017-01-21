//
//  ViewControllerFactory.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

protocol ViewControllerFactory {
    var injector: ViewInjector { get set }
    func instantiateViewController(of: ViewControllerKind) -> UIViewController
}

enum ViewControllerKind: String {
    case postList = "PostListViewController"
    case postDetail = "PostDetailViewController"
    
    var identifier: String { return self.rawValue }
}

fileprivate enum StoryboardSection: String {
    case main = "Main"
}

class ViewControllerFactoryStoryboardImplementation: ViewControllerFactory {
    
    var injector: ViewInjector = ViewInjector()
    
    init() {
        print("factory initialized")
    }

    deinit {
        print("factory DEINIT")
    }

    
    private func storyboard(section: StoryboardSection) -> UIStoryboard {
        return UIStoryboard(name: section.rawValue, bundle: nil)
    }
    
    private var mainStoryboard: UIStoryboard {
        return storyboard(section: .main)
    }
    
    func instantiateViewController(of kind: ViewControllerKind) -> UIViewController {
        var vc: UIViewController!
        switch kind {
        case .postList, .postDetail:     vc = mainStoryboard.instantiateViewController(withIdentifier: kind.identifier)
        }
        injector.inject(view: vc)
        return vc
    }
}
