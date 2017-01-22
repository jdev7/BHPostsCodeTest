//
//  UIViewControllerExtension.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

extension UIViewController {
        
    func setTitle(title: String) {
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.bhPurple,
            NSFontAttributeName: UIFont.avenirRomanFont(size: 17.0)
        ]
        
        self.title = title
    }
}
