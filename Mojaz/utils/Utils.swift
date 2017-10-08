//
//  Utils.swift
//  Super Market
//
//  Created by mac on 11/28/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import Foundation

import Firebase
import FirebaseInstanceID
import FirebaseMessaging


class Utils{

    static func isValidEmail(emailStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailStr)
    }
    static func firebaseToken()->String{
        
    
        return InstanceID.instanceID().token() ?? "qwerwqerqwrewqrw"

    }
      static func textFieldsIsEmpty(tf: UITextField... )->Bool{
        
        for field in tf {
        
            if field.text!.isEmpty {
                return true;
                
            }
        }
        return false;
        
    }
    
    static func placeHolderOfEmptyTextField(tf: UITextField... )->String!{
        
        for field in tf {
            
            if field.text!.isEmpty{
                return field.placeholder;
                
            }
        }
        return nil;
        
    }
    
   
    static func share(vc: UIViewController ,  objectsToShare:[Any]){
    
    let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
    
    activityVC.popoverPresentationController?.sourceView = vc.view
    vc.present(activityVC, animated: true, completion: nil)

    
    }
    
    static func numberOfSectionsInCollectionView(array:[Any] ,sectionsCount:Int)->Int{
        return array.count / sectionsCount + (array.count % sectionsCount>0 ? 1 : 0) ;

    }
    
    static func numberOfItemsInSection(section:Int, array:[Any] ,sectionsCount:Int)->Int{
        
        if (section >= (array.count/sectionsCount)) {
            if (array.count % sectionsCount > 0) {
                return array.count % sectionsCount;
            }
            
        }
        return sectionsCount;
        
    }
    
    static func itemPostionInArray(indexPath:IndexPath,sectionsCount:Int)->Int{
        
       return (indexPath.section * sectionsCount) + indexPath.row;
    }
    
    
    static func writeToFile(textToWrite:String , filewithExt:String){
    
        //this is the file. we will write to and read from it
        

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(filewithExt)
            
            //writing
            do {
                try textToWrite.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
            
         
        }    }
    
    
    static func readFromFile(file:String)->String{
        
       
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            
            //writing
           
            
            //reading
            do {
                let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)
                return text2
            }catch {/* error handling here */ }
        }
     return "no data"
    
    }
    
    
    static  func openLink(url:String){
        if UIApplication.shared.canOpenURL(URL(string: url)!) {
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        }else{
            ZToast.alert(message: "Cant open url " + url)
        }
        
        
    }
    
    static func setCollectionCellSize(collectionView:UICollectionView , cellWidth:CGFloat ){
    
    
        
        let padding:CGFloat = 15.0
        let cellSize =  UIScreen.main.bounds.size.width - (2*padding)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.itemSize = CGSize(width:cellSize / cellWidth , height: (cellSize / cellWidth ) + 30 )
        collectionView.collectionViewLayout = layout
     
        
        
    }
    static  func call(number:String){
        let link = "tel:\(number)"
        if UIApplication.shared.canOpenURL(URL(string: link)!) {
            UIApplication.shared.open(URL(string: link)!, options: [:], completionHandler: nil)
        }else{
            ZToast.alert(message: "Can\'t call this number " + number)
        }
        
        
    }
    
    static func convertToDictionary(text: String) -> [String: Any]? {
        
        if let data = text.data(using: .utf8) {
            do {
                let res = try JSONSerialization.jsonObject(with: data, options:.allowFragments)
                return res as? [String: Any];
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    //let str = "{\"name\":\"James\"}"
    
    //let dict = convertToDictionary(text: str)

}
