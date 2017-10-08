//
//  UserModel.swift
//  Toredo
//
//  Created by abuzeid on 8/19/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import Foundation


class UserModel{
    

    dynamic var social_id:String = "";
    dynamic var email = "";
    dynamic var image = "";
    dynamic var user_id:Int16 = 0;
    dynamic var id:Int16 = 0;
    dynamic var user_type:Int16 = 1;
    dynamic var rate:Float = 0;
    dynamic var name = "";
     dynamic var token = "";
    
    convenience init(json: [String: AnyObject]) {
        self.init()
        if let _id = json["id"] as? Int{
            self.id = Int16(_id)
        }
        
        if let user_id = json["user_id"] as? String{
            self.user_id  = Int16(user_id)!
        }
        if let social_id = json["social_id"] as? String{
            self.social_id  = social_id
        }
        if let  name = json["name"] as? String{
            self.name = name
            
        }
        if let  name = json["image"] as? String{
            self.image = name
        }
        
        if let  name = json["email"] as? String{
            self.email = name
        }
        if let rate = json["rate"] as? Float{
            self.rate = rate
        }
        
        if let user_type = json["user_type"] as? String{
            if let int = Int16(user_type){
                self.user_type = int
            }
        }
        if let user_type = json["user_type"] as? Int{
            self.user_type = Int16(user_type)
        }

        
    }
}



