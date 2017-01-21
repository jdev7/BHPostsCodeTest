//
//  MainViewController.swift
//  BHPostsCodeTest
//
//  Created by Juan Navas Martin on 21/1/17.
//  Copyright © 2017 Perhapps. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var router: BHRouter!

    @IBAction func openPosts(_ sender: Any) {
        router.navigateToPostsList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " "
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
}
