//
//  sidemenu_header_no_user.swift
//  Wethaq
//
//  Created by mac on 3/27/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class sidemenu_header_no_user: UIView {
    
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    
    
    override func awakeFromNib() {
        if let us = app.getUser(){
            usernameLbl.text = us.name
//            if let im = us.image{
//                if let url = URL(string: im){
//                    self.iv.kf.setImage(with: url)
//                }
//            }
            
        }
        
    }
    
}

