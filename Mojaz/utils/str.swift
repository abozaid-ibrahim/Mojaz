
//
//  Str.swift
//  Captumia
//
//  Created by abuzeid on 6/7/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation
class s{
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: NSNotification.Name.me.langaugeChanged, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc  func update(){
    s.id = s()
    }
    static var id = s()

    
     let album = "Album".localized
     let remove = "Remove".localized
     let from = "From".localized
     let to  = "to".localized
     let enter_fields = "please enter all fields".localized
     let appName = "Toredo".localized
     let write_message = "Enter your message".localized
     let invalid_credentials = "Username or password not correct.".localized
     let select_country_first = "Please select country first".localized
     let male = "Male".localized
     let female = "Female".localized
     let register = "Register".localized
     let enter_field = "Please enter ".localized
     let passwordMinLength = "password must be 6 char at least".localized
     let passwordNotIdentical = "sorry, your pasword not typical".localized
     let enter_valid_email = "sorry, write correct email".localized
    
    
     let signup_success_message = "Welcome to Toredo".localized
     let profile = "Profile".localized
     let profile_updated = "Your profile updated".localized
     let recent_orders = "Recent Orders".localized
     let ok = "Ok".localized
     let cancel = "Cancel".localized
     let logout = "Log Out".localized
     let login = "Login".localized
     let notification = "Notifications".localized
     let logout_alert = "Are you sure you want to logout now?".localized
     let finish = "Finish".localized
     let complete = "Complete".localized
     let continu = "Continue".localized
     let forgetPassword = "".localized
     let joinus = "Join Us".localized
     let enter_user_n_password = "Please enter username and password".localized
     let enter_amount = "Enter Amount".localized
     let soiree = "Soiree".localized
     let wedding = "Wedding".localized
     let privacy_policy = "Privacy Policy".localized
     let home  = "Home".localized
     let aboutUs = "About Toredo".localized
     let all_brands = "All Brands".localized
     let all_cats = "All Categories".localized
     let shareApp = "Share App".localized
     let allcities = "All Cities".localized
     let contact_us = "Contact Us".localized
     let language = "Language".localized
     let choose_country = "Choose Country".localized
     let choose_language = "Choose Language".localized
     let messages = "Messages".localized
     let my_posts = "My Posts".localized
     let my_closed_posts = "My Closed Posts".localized
     let no_self_msg  = "You can't message your self".localized
     let change_profile = "Change Profile".localized
     let change_pass = "Change Password".localized
     let add_trade_req = "Add Trade Request".localized
    
     let enter_title = "Enter Title".localized
     let enter_address = "Enter Address".localized
     let enter_desc = "Enter Description".localized
     let replies = "Replies".localized
     let became_a_premuim = "Became a Premuim".localized
     let upload_image = "Upload Image".localized
    
     let thank_you = "Thank You!".localized
     let viprq = "Your Request has been sent successfully Sent to adminstration".localized
     let close_toredo_post = "You Will Close Your Toredo Request.".localized
     let attention = "Attension!".localized
     let login_first = "You must login first"
    
    
    
    let camera = "Camera".localized
    let gallery = "Gallery".localized
    let keep_tap_to_recod = "Keep tapping on button to record message".localized
    
    let user_not_found = "User Not Found".localized
    let empty_response = "There's no data"
}
