//
//  RootViewController.swift
//  Mojaz
//
//  Created by abuzeid on 9/25/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
       navigationBar.barTintColor = UIColor.mainColor
//        navigationBar. = UIColor.mainColor
        navigationBar.tintColor = UIColor.white
        self.navigationBar.isTranslucent = false
self.navigationBar.shadowImage = UIImage()
    }

    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
