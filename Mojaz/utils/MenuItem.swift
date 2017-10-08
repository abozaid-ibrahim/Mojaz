//
//  MenuItem.swift
//  Super Market
//
//  Created by mac on 11/28/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import UIKit
struct MenuItem{
    var storyboardId:String?
    var item_title:String?
    var item_icon:String?
    var task:task?
    var vc:UIViewController?
    var icon:UIImage?
    
    init(title:String,iconame:String,stid:String) {
        self.storyboardId = stid;
        self.item_icon = iconame
        self.item_title = title
        
    }
    
    
    init(title:String,icon:UIImage?,task:task ,vc:UIViewController!) {
            self.vc = vc
            
        
        self.icon = icon
        self.task = task
        self.item_title = title
        
    }
    
    
    init(textTitle:String,id:String){
    
    self.item_title = textTitle
    self.storyboardId = id
    
    }

}
