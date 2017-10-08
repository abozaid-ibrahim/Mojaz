//
//  Local.swift
//  Super Market
//
//  Created by mac on 11/27/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation

private class Localizator {
    
    var bundle: Bundle = Bundle()

    init() {
updateBundle()
        NotificationCenter.default.addObserver(self, selector: #selector(updateBundle), name: NSNotification.Name.me.langaugeChanged, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateBundle(){
        bundle = LanguageManager.sharedInstance.getCurrentBundle()

    }
    static let sharedInstance = Localizator()

    func localize(string: String) -> String {
        
      return  NSLocalizedString(string, bundle: bundle, comment: string)

    }
}

extension String {
    var localized: String {
        
        return self;
        
        //return Localizator.sharedInstance.localize(string: self)
    }
}
