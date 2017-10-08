//
//  PopUpViewController.swift
//  Captumia
//
//  Created by abuzeid on 5/20/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class PopUpViewController: BaseViewController {
    var dismissView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        if dismissView == nil{
            dismissView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main
                .bounds.height))
            
            dismissView!.backgroundColor = UIColor.lightGray
            dismissView!.alpha = 0.6
            self.view.insertSubview(self.dismissView!, at: 0)
            
            
        }
        
        let gest  = UITapGestureRecognizer(target: self, action: #selector(dismissController(sender:)))
        self.dismissView!.addGestureRecognizer(gest)
        
        self.hideKeypadWithTextFields()
    }
    
    
    
    
    func dismissController(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    

}
