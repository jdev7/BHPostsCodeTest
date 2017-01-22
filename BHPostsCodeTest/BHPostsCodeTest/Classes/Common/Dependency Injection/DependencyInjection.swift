//
//  DependencyInjection.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

//View
class MainInjector {
    fileprivate let interactorInjector: InteractorInjector = InteractorInjector()
    fileprivate lazy var factory: ViewControllerFactory = ViewControllerFactoryStoryboardImplementation(injector: self)
    fileprivate lazy var presenterInjector: PresenterInjector = { return PresenterInjector(router: self.router) }()
    
    lazy var router: BHRouter = { return BHRouterImplementation(factory: self.factory) }()
    
}

extension MainInjector {
    private func injectProperties(view: MainViewController) {
        view.router = self.router
    }

    private func injectProperties(view: PostListView) {
        view.presenter = presenterInjector.postListEventHandler
    }
    
    func inject(view: UIViewController) {
        if let view = view as? UINavigationController, let topVC = view.topViewController {
            inject(view: topVC)
        }
        else if let view = view as? MainViewController {
            injectProperties(view: view)
        }
        else if let view = view as? PostListView {
            injectProperties(view: view)
        }
    }
}

//Presenter
class PresenterInjector {
    private let interactorInjector: InteractorInjector = InteractorInjector()
    private let router: BHRouter
    
    init(router: BHRouter) {
        self.router = router
    }
    
    var postListEventHandler: PostListEventHandler {
        let presenter = PostListPresenter()
        
        presenter.interactor = interactorInjector.postListInteractor
        presenter.router = router
        
        return presenter
    }
}


//Interactor
class InteractorInjector {
    var postListInteractor: PostListInteractorInput {
        let interactor = PostListInteractor()
        interactor.networkDataStore = ReadDataStoreRESTImplementation()
        return interactor
    }
}


//Services


//Data
