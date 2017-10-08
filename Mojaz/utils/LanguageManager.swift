//
//  LanguageManager.swift
//  SMSLocalization
//
//  Created by Macuser on 5/19/16.
//  Copyright © 2016 Macuser. All rights reserved.
//

import UIKit

class LanguageManager: NSObject {
    
    
    var availableLocales = [CustomLocale]()
    static let sharedInstance = LanguageManager()
    var lprojBasePath = String()
    
    override fileprivate init() {
        
        super.init()
        let english = CustomLocale(languageCode: constants.englishCode, countryCode: "en", name: "United Kingdom")
        let arabic  = CustomLocale(languageCode: constants.arabicCode, countryCode: "ar", name: "Egypt")
        self.availableLocales = [english,arabic]
        updateLangPath()
        NotificationCenter.default.addObserver(self, selector: #selector(updateLangPath), name: NSNotification.Name.me.langaugeChanged, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateLangPath(){
        self.lprojBasePath =  getSelectedLocale()
}
     func getSelectedLocale()->String{
        
        let lang = Locale.preferredLanguages//returns array of preferred languages
        let languageComponents: [String : String] = Locale.components(fromIdentifier: lang[0])
        if let languageCode: String = languageComponents["kCFLocaleLanguageCodeKey"]{
            
            for customlocale in availableLocales {
                
                if( customlocale.languageCode == languageCode ){
                    
                    return customlocale.languageCode!
                }
            }
        }
        return constants.defaultCode
    
    
    }
    
    func getCurrentBundle()->Bundle{
        
        if let bundle = Bundle.main.path(forResource: lprojBasePath, ofType: "lproj"){
            
            return Bundle(path: bundle)!
            
        }else{
            //return nil
            fatalError("lproj files not found on project directory. /n Hint:Localize your strings file")
        }
    }
    
    func setLocale(_ langCode:String){
        UserDefaults.standard.set(langCode, forKey: constants.USER_PREF_LANG)//replaces Locale.preferredLanguages

        UserDefaults.standard.set([langCode], forKey: "AppleLanguages")//replaces Locale.preferredLanguages
        UserDefaults.standard.synchronize()
        self.lprojBasePath =  getSelectedLocale()
    }
}
