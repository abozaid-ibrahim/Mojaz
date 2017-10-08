//
//  Cuts.swift
//  Super Market
//
//  Created by mac on 11/28/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import UIKit



class Cuts {
    static func mainstory()->UIStoryboard {
        
        return UIStoryboard(name: "Main", bundle: nil);
    }
    
    static func popover(vc:BaseViewController,popup:UIViewController){
        
//        let popController = popup.popoverPresentationController
//        popController?.permittedArrowDirections = .any
//        
        popup.modalPresentationStyle = .overCurrentContext //presentation style
    popup.presentationController?.delegate = vc
        vc.present(popup, animated: true, completion: nil)
        popup.popoverPresentationController?.sourceView = vc.view
        popup.popoverPresentationController?.sourceRect = vc.view.frame
        
        
        
        
    }
   
    
    
    static func present(vc:UIViewController,storyid:String){
        let controller =  UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: storyid)
        
        vc.present(controller, animated: true);
        
    }
    
    
    
    
    
    static func vc(storyid:String)->UIViewController{
        return  UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: storyid)
        
    }
    //media player sotryboard
    static func mvc(storyid:String)->UIViewController{
        return  UIStoryboard(name: "MediaPlayer", bundle: nil)
            .instantiateViewController(withIdentifier: storyid)
        
    }
    
    
    
    
    
    
}
