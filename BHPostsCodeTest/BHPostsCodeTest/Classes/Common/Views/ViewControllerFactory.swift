//
//  ViewControllerFactory.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

protocol ViewControllerFactory: class {
    weak var injector: MainInjector! { get set }
    func instantiateViewController(of: ViewControllerKind) -> UIViewController
}

enum ViewControllerKind: String {
    case main = "mainNavigationController"
    case postList = "PostListViewController"
    case postDetail = "PostDetailViewController"
    
    var identifier: String { return self.rawValue }
}

fileprivate enum StoryboardSection: String {
    case main = "Main"
}

class ViewControllerFactoryStoryboardImplementation: ViewControllerFactory {
    
    weak var injector: MainInjector!
    
    init(injector: MainInjector) {
        self.injector = injector
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
        case .main, .postList, .postDetail:     vc = mainStoryboard.instantiateViewController(withIdentifier: kind.identifier)
        }
        injector.inject(view: vc)
        return vc
    }
}
