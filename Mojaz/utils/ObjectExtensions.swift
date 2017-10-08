//
//  ObjectExtensions.swift
//  Captumia
//
//  Created by mac on 5/12/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary{

    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}
extension String {



func getDate() -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = constants.default_datetime_format
    //dateFormatter.locale = Locale.init(identifier: "en_GB")
    if let dateObj = dateFormatter.date(from: self){
        
        dateFormatter.dateFormat = constants.default_date_format
        return dateFormatter.string(from: dateObj)
    }else{
        return self
    }
    
    
    
}
    
    var html2AttributedString: NSAttributedString? {
            do {
                return try NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
            } catch {
                print("error:", error)
                return nil
            }
        }
       
    
    
    
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.characters.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
    
    
    
func getTime() -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = constants.default_datetime_format
    //dateFormatter.locale = Locale.init(identifier: "en_GB")
    if let dateObj = dateFormatter.date(from: self){
        
        dateFormatter.dateFormat = constants.default_time_format
        return dateFormatter.string(from: dateObj)
    }else{
        return self
    }
    
    
    
}
    ////----
    
    
    /*, these all equal true.
     
     "abcde"[0] == "a"
     "abcde"[0...2] == "abc"
     "abcde"[2..<4] == "cd"
     */
    

    
    
    subscript (i: Int) -> Character {
       
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

}



extension Date {
    
    
    
    func getFormattedTimeFromPicker()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = constants.default_uipicker_datetime
        
        let dateString = "\(self)"
        if let dateObj = dateFormatter.date(from: dateString){
            
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: dateObj)
        }else{
            return "\(self)"
        }
        

    }
    
    func getFormattedDateFromPicker()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = constants.default_uipicker_datetime
        
        let dateString = "\(self)"
        if let dateObj = dateFormatter.date(from: dateString){
            
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: dateObj)
        }else{
            return "\(self)"
        }
        
        

        
    }
    
    
    func isGreaterThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    /*
     func addDays(daysToAdd: Int) -> NSDate {
     let secondsInDays: NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
     let dateWithDaysAdded: NSDate = self.dateByAddingTimeInterval(secondsInDays)
     
     //Return Result
     return dateWithDaysAdded
     }
     
     func addHours(hoursToAdd: Int) -> NSDate {
     let secondsInHours: NSTimeInterval = Double(hoursToAdd) * 60 * 60
     let dateWithHoursAdded: NSDate = self.dateByAddingTimeInterval(secondsInHours)
     
     //Return Result
     return dateWithHoursAdded
     }*/
}

extension NSObject{
    
    static func debug(){
        print(#file)
        print(#function)
        print(#line)
        
    }
}
