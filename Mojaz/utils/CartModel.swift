//
//  CartModel.swift
//  Super Market
//
//  Created by mac on 11/30/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class CartModel {
    
    
  
    dynamic var title = "";
    dynamic var price:Double = 0;
    dynamic var quantity = 0;
    dynamic var id = 0;
    convenience init(json: [String: Any]) {
        self.init()
        
        
        
        
        if let _id = json["id"] as? Int{
            self.id = _id
        }
        
        if let value = json["title"] as? String{
            self.title = value
        }

            
            
            if let qnt = json["quantity"] as? Int{
                self.quantity = qnt
            }
            
            if let value = json["price"] as? Double{
                self.price = value
            }

            
            
    }

   
}
