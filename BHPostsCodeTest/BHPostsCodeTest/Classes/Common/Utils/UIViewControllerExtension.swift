//
//  UIViewControllerExtension.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit
import PKHUD

extension UIViewController {
    func showLoading() {
        HUD.show(.progress)
    }
    
    func stopLoading()  {
        HUD.hide()
    }
}
