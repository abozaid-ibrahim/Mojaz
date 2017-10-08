//
//  Notifier.swift
//  Captumia
//
//  Created by abuzeid on 5/20/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class Notifier: NSObject {
    
    static func post(name:String){
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: nil, userInfo: nil)
    }
    
    static func post(n:NSNotification.Name){
        NotificationCenter.default.post(name: n, object: nil, userInfo: nil)
    }
    
    static func observer(vc:BaseViewController  ,selector:Selector,name:String){
    
       NotificationCenter.default.addObserver(vc, selector: selector, name:NSNotification.Name(rawValue: name), object: nil)
        
        
    }
    
   
}







extension NSNotification.Name{
        public struct me {
            public static let update_side_menu = Notification.Name(rawValue: "com.abuzeid.updatemenu")
            public static let update_comments = Notification.Name(rawValue: "com.abuzeid.updaercomments")
            public static let update_replies = Notification.Name(rawValue: "com.abuzeid.update_replies")
            public static let traded_with = Notification.Name(rawValue: "com.abuzeid.tradwithdialog")
            public static let fullScreenPager = Notification.Name(rawValue: "com.abuzeid.fullpager")
            public static let notif_open_replies = Notification.Name(rawValue: "notif_open_replies")
            public static let notif_open_comments = Notification.Name(rawValue: "notif_open_comm")

            public static let langaugeChanged = Notification.Name(rawValue: "com.abuzeid.updatelanguage")

    }
}
