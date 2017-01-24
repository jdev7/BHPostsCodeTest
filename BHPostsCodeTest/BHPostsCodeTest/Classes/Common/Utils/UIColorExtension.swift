//
//  UIColorExtension.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init (hex: Int) {
        self.init(red: CGFloat((hex >> 16) & 0xFF) / 255.0,
                  green: CGFloat((hex >> 8) & 0xFF)  / 255.0,
                  blue: CGFloat(hex & 0xFF) / 255.0,
                  alpha: CGFloat(1.0))
    }
    
    class var bhPurple: UIColor {
        return UIColor(hex: 0x9013FE)
    }
}
