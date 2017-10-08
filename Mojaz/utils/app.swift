//
//  app.swift
//  Super Market
//
//  Created by mac on 11/23/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import FirebaseMessaging
import UIKit
class app{
    
    static func englishLocale()->Bool{
        return LanguageManager.sharedInstance.getSelectedLocale() == constants.englishCode
        
    }
    static func commaEmail(em:String)->String{
        
        return em.replacingOccurrences(of: ".", with: ",")
    }
    static func commaEmail()->String{
        guard let email  = app.getUser()?.email else{
            return "nil";
        }
        return email.replacingOccurrences(of: ".", with: ",")
    }
    
    
    static func saveUserData(user:UserModel){
        app.removeUserData()
        }
    static func saveUserPassword(p:String){
    UserDefaults.standard.set(p, forKey: constants.user_password)
        UserDefaults.standard.synchronize()
    }
    static func getLocale()->String{
        let lang = UserDefaults.standard.value(forKey: constants.USER_PREF_LANG)
        if ( lang != nil) {
            return lang as! String;
            
        }
        return constants.defaultCode
    }
    static func saveAppLang(code:String){
        UserDefaults.standard.set(code, forKey: constants.USER_PREF_LANG)
        UserDefaults.standard.synchronize()
        
        
    }
    
    
    static func setUserIvBG(utype:Int,iv:UIImageView){
   
            if Int(utype) == usertype.normal.rawValue{
            iv.image = #imageLiteral(resourceName: "normal_cycle")
            }else{
                iv.image = #imageLiteral(resourceName: "vip_circle")
            }
        
    }
    static func setCartCount(count:Int){
        UserDefaults.standard.set(count, forKey: "cartcount")
        UserDefaults.standard.synchronize()
    }
    
    static func getCartCount()->String{
        if let c =   UserDefaults.standard.string(forKey: "cartcount"){
            return c;
        }else{
        return "0"
        }
    }

    
    
    static func getAppShareLink()->String{
        
        return "https://itunes.apple.com/us/app/toredo/id1277328430?ls=1&mt=8"
    }
    static func removeUserData(){
        
        
UserDefaults.standard.removeObject(forKey: "read")
        UserDefaults.standard.synchronize()
        
        if let ouser = app.getUser(){
            
        
        
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: constants.USER_PROF_IMG), object: nil)
        
        
        }}
    
    

    
   
    static func getUser()->UserModel?{
              return nil;
        
    }
    static func getUserId()->Int{
      
        if let u = app.getUser() {
            return Int(u.id)
        }
        return 0
        
    }
    
   
    
    
    
    static func isUserLoggedIn()->Bool{
        
       
        return app.getUserId() > 0
        
    }
    
    
    static var localeType:String?
    
}
