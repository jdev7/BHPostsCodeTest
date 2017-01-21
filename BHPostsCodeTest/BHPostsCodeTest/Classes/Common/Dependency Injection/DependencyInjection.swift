//
//  DependencyInjection.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

//View
class ViewInjector {
    private let presenterInjector: PresenterInjector = PresenterInjector()
    
    private func injectProperties(view: PostListView) {
        view.presenter = presenterInjector.postListEventHandler
    }
    
    func inject(view: UIViewController) {
        if let view = view as? PostListView {
            injectProperties(view: view)
        }
    }
}

//Presenter
class PresenterInjector {
    private let interactorInjector: InteractorInjector = InteractorInjector()
    private let routerInjector: RouterInjector = RouterInjector()
    
    var postListEventHandler: PostListEventHandler {
        let presenter = PostListPresenter()
        
        presenter.interactor = interactorInjector.postListInteractor
        presenter.router = routerInjector.router
        
        return presenter
    }
}


//Interactor
class InteractorInjector {
    var postListInteractor: PostListInteractorInput { return PostListInteractor() }
}


//Router

class RouterInjector {
    var router: BHRouter { return BHRouterImplementation(factory: ViewControllerFactoryStoryboardImplementation()) }
}


//Services


//Data
