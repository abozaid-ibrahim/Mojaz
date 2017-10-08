//
//  style.swift
//  Captumia
//
//  Created by abuzeid on 6/10/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
class style{
    

}
extension UIButton {
        func buttonStyle(){
    self.backgroundColor = UIColor.mainColor
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius  = 12
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
    
    }

}
