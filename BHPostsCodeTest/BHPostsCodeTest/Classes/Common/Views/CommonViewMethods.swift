//
//  CommonViewMethods.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 22/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import Foundation
import PKHUD

protocol CommonViewMethods: class {
    func showLoading()
    func stopLoading()
    func showError(withMessage: String)
}

extension CommonViewMethods where Self: UIViewController {
    func showLoading() {
        HUD.show(.progress)
    }
    
    func stopLoading()  {
        HUD.hide()
    }
    
    func showError(withMessage message: String) {
        stopLoading()
        print("error: \(message)")
    }
}
