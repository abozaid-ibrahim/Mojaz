//
//  SpinnerItemSelectedProtocol.swift
//  Super Market
//
//  Created by mac on 11/30/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import UIKit

@objc protocol SpinnerItemSelectedProtocol {
    init() 
     @objc optional func itemSelected(selectedItem:[String:AnyObject]);
    @objc optional func itemSelected(selectedItem:[String:AnyObject] , tf:UITextField);
    @objc optional func itemSelected(selectedItem:[String:AnyObject] , lbl:UILabel);

    @objc optional func callbackString(string:String);
}
