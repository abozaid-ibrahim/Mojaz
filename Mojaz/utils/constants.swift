//
//  File.swift
//  Super Market
//
//  Created by mac on 11/23/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import UIKit


struct constants{
    
    
    
    static let st = "http://api.mojz.me/v3/latest";

    
    static let BASE_URL = "";

    static let country  = "country"
    static let city = "city"
    static let cityId = "cityid"
    static let countryId = "countryid"
    static var lang_params = "lang=\(app.englishLocale() ? "en" : "ar")"
    
    static let notify_cartCount = "notfiy"
    
    static let default_uipicker_datetime = "yyyy-MM-dd HH:mm:ss Z"//2016-05-21 18:08:22 +0000
    
    static let default_datetime_format = "yyyy-MM-dd HH:mm:ss"
    static let default_date_format = "dd MMM yyyy"
    static let default_time_format = "h:mm a"
    
    static let user_password = "userpassword"
    
    static let min_password_char_count = 5
    static let englishCode = "en"
    static let arabicCode = "ar"
    static let defaultCode = "en"
    
    static let USER_PREF_LANG = "user_prefered_lang"
    static let USER_PROF_IMG = "profileiamge"
    static let FONT_NAME = "DroidArabicKufi"
    
    
    static let filterBusiness = "FILTER_BUS"
    static let notif_update_sidemenu = "com.abuzeid.updatemenu";
    
    
    
    static let new_des_length = 80
    
    static let NAVIGATION_BAR_HEIGHT = CGFloat(64.0);
    
    
    static let member_ship_supply_demand =  0
    static let usertype_supply_demand =  2
    static let usertype_monasabt = 3
    
    
    static let defualtPlaceHolder = #imageLiteral(resourceName: "chat")
    
    static let notify_dismissSrartMenu = "notify_dismissSrartMenu"
    
    static let notify_dismissEndMenu = "notify_dismissEndMenu"
    
    
    static let notify_freespacepost_added = "notify_freespacepost_added"
    static let notify_grouppost_added = "notify_grouppost_added"
    
    static let notify_navigation_bar = "updateNavigationBar"
   
    static let TimeToUpdateTheUINotificaiton = "TimeToUpdateTheUINotificaiton"
    static let allSubCatsObject:[String:AnyObject] = ["id": 0 as AnyObject ,"name" : s.id.all_cats as AnyObject]

    static let allBrandsObject:[String:AnyObject] = ["id": 0 as AnyObject ,"name" : s.id.all_brands as AnyObject]
    static let  commentCell = 1
    static let replyCell = 2

}
enum usertype:Int{
case normal = 1
case vip = 2
}

enum notiftype:String{

    case vip_activated = "vip_activated",
    vip_refused = "vip_refused",
    comment_notify = "comment_notify",
    reply_notify = "reply_notify",
    rate_notify = "rate_notify",
    view_rate_notify = "view_rate_notify"
    
    

}

enum Language:String{
    case en = "English" ,ar = "Arabic"
    
}


enum task:Int{
    case none,share,logout
}


enum post_action:String{
    case byCountry = "postbycountry", mylist = "mylist", filter = "postbycatgs"
}


















