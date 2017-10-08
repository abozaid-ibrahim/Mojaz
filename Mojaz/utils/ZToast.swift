//
//  ZToast.swift
//  Super Market
//
//  Created by Abuzeid on 11/28/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import Foundation
import ARSLineProgress


class ZToast{
    
    
    static func showFail(){

    ARSLineProgress.showFail()
        
        
        
    }
    
    
    static func showFail(message:String){
//        
//        DispatchQueue.main.async {
//            let tost =  Toast(text:message);
//            tost.view.backgroundColor = UIColor.yellow
//            tost.view.textColor = UIColor.black
//            tost.duration  = 3
//        tost.show()
//        }
        
        
    }
    
    
    static func alertFail(message:String){
        let alert = UIAlertController(title:nil , message: message, preferredStyle: UIAlertControllerStyle.alert)

        alert.addAction(UIAlertAction(title: s.id.ok, style: .default, handler: nil))
        if  UIApplication.shared.keyWindow?.rootViewController != nil{
            
            
            UIApplication.shared.keyWindow!.rootViewController!.present(alert, animated: true, completion: nil)
            
        }else{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
            
            
            
        }
        
    }
    
    
    
    
    static func showSuccess(){
        
        ARSLineProgress.showSuccess()
        
        
        
    }
    
    
    static func show(message:String){
        DispatchQueue.main.async {
           // Toast(text:message).show()
        }
    }
    static func alert(message:String){
        
        
        DispatchQueue.main.async {
        //Toast(text:message).show()
        }
        /*
        
     let alert = UIAlertController(title:nil , message: message, preferredStyle: UIAlertControllerStyle.alert)
        if  UIApplication.shared.keyWindow?.rootViewController != nil{
        
        
             UIApplication.shared.keyWindow!.rootViewController!.present(alert, animated: true, completion: nil)
            
        }else{
        
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
        
        
        
        }
            
            
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2) ) {
            alert.dismiss(animated: true, completion: nil)
        }
        */
    
    }

    static func alert(vc:UIViewController ,message:String){
      
       // Toast(text:message).show()
        
        /*
        let alert = UIAlertController(title:nil , message: message, preferredStyle: UIAlertControllerStyle.alert)

        DispatchQueue.main.async{
        alert.view.backgroundColor = UIColor.darkGray
        vc.present(alert, animated: true, completion: nil)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2) ) {
            alert.dismiss(animated: true, completion: nil)
        }
        
     */
    }



}
