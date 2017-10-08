//
//  CustomView.swift
//  Smachna
//
//  Created by mac on 1/13/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Kingfisher





/*
 
 
 */

extension BaseViewController {
    /*======================= DATE PICKER =========================*/

    
/*================================================*/

    func hideKeypadWithTextFields(){
        let gest = UITapGestureRecognizer(target: self, action: #selector(hideKeypad))
        
        view.addGestureRecognizer(gest)
        enableReturnButton(sender: self.view)
    }
    
    func hideKeypad(sender:UIView){
        view.endEditing(true)
        
        for v in view.subviews {
            if v === UITextField.self {
                v.endEditing(true)
            }
        }
        
        
    }
    
    
    func myfont(size:CGFloat)->UIFont{
        return UIFont(name: constants.FONT_NAME, size:size)!
    }
    
    func setAppFont(sender:UIView){
        
        for v in sender.subviews {
            
            if v.classForCoder === UITextField.classForCoder() {
                (v as! UITextField).font = UIFont(name: constants.FONT_NAME, size: ((v as! UITextField).font!.pointSize))
                
            }else if v.classForCoder  === UILabel.classForCoder() {
                let size = (v as! UILabel).font!.pointSize
//                (v as! UILabel).font = myfont(size: size)
                
            }else if v.classForCoder === UIButton.classForCoder() {
                
                //                        (v as! UIButton).titleLabel?.font = UIFont(name: constants.FONT_NAME, size: ((v as! UIButton).titleLabel!.font.pointSize))!
            }else if v.classForCoder === UITextView.classForCoder() {
                (v as! UITextView).font = UIFont(name: constants.FONT_NAME, size: ((v as! UITextView).font!.pointSize))
                
            }else if v.subviews.count>0 {
                setAppFont(sender: v)
                
            }
        }
        
        
    }
    
    
    
    
    
    
    func enableReturnButton(sender:UIView){
        if sender.classForCoder == UITextField.classForCoder(){
            (sender as! UITextField).delegate = self
        }
        for v in sender.subviews {
            if v.classForCoder == UITextField.classForCoder() {
                
                (v as! UITextField).delegate = self
            }else if v.subviews.count>0 {
                enableReturnButton(sender: v)
                
            }
        }
        
        
    }
    
    
    
}









/*==================================================================*/
/*==================================================================*/
/*===================                   ============================*/
/*===================       UIVIEW      =============================*/
/*===================                   =============================*/
/*==================================================================*/
/*==================================================================*/




@IBDesignable
extension UIView{
    
    
    
    
    @IBInspectable
    public var cornerRadius :CGFloat {
        
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            
        }
        
        get {
            return layer.cornerRadius
        }
        
    }
    
    
    
    
    
    @IBInspectable
    public var circleView :Bool {
        
        
        set {
            if newValue == true {
                layer.cornerRadius = min(layer.bounds.height, layer.bounds.width) / 2
                layer.masksToBounds = newValue
            }
            
            
        }
        
        get {
            return layer.masksToBounds
        }
        
    }
    
    @IBInspectable
    public var borderThick :CGFloat {
        
        
        set {
            
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0

        }
        
        get {
            return layer.borderWidth
        }
        
    }
    

    
    
    @IBInspectable
    public var bordrColor :UIColor {
        
        
        set {
            layer.borderColor = newValue.cgColor
            layer.masksToBounds = true

            
        }
        
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        
    }
    
    
    
    
    
    
    
    func setRounded() {
      
        self.layer.cornerRadius = self.frame.height / 2.0
        self.clipsToBounds = true
        
        
        
    }
}














extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}

extension UITextField{
    
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
    
    
    
    
    
    
}
extension UIImageView{
     func webImage(url:String){
self.kf.setImage(with: URL(string: url), placeholder: constants.defualtPlaceHolder, options: nil, progressBlock: nil, completionHandler: nil)
    }
}
extension UIColor{
    
    
    
    
//        static func randomColor() -> UIColor {
//            // If you wanted a random alpha, just create another
//            // random number for that too.
//            return UIColor(red:   .random(),
//                           green: .random(),
//                           blue:  .random(),
//                           alpha: 1.0)
//        }
//    
    open class var mainColor: UIColor { get{
        return UIColor(displayP3Red: 111/255, green: 103/255, blue: 174/255, alpha: 1)
        }
    }
    
    open class var secondaryColor: UIColor { get{
        return UIColor(displayP3Red: 147/255, green: 70/255, blue: 154/255, alpha: 1)
        }
    }
    
    
    
    open class var mygreenColor: UIColor { get{
        //971A52textColor
        return UIColor.init(colorLiteralRed: (34/255), green: 159/255, blue: 95/255, alpha: 1)
        }
    }
    open class var bgColor: UIColor { get{
        return UIColor.init(red: 233/255, green: 235/255, blue: 238/255, alpha: 1)
        
        
        //.init(colorLiteralRed: 1, green:  1, blue:  1, alpha: 0.25)
        }
        
    } // 0.0, 0.0, 1.0 RGB
    
    
    
    
}




private var extrasKey:Any?

private var indexP:IndexPath?
private var val = "0"

extension UICollectionView{
    func setCategoryCellSize(){
    
    
        
        let padding:CGFloat = UIScreen.main.bounds.size.width / 15.0
        let cellSize =  UIScreen.main.bounds.size.width - (2*padding)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: padding, right: padding)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.itemSize = CGSize(width:cellSize*0.49 , height: (cellSize*0.49  ))
        self.collectionViewLayout = layout
        
        
    }
    
    func setSquareCellSize(sectionsCount:Int){
        
        
        
        let padding:CGFloat = UIScreen.main.bounds.size.width / 15.0
        let cellSize =  UIScreen.main.bounds.size.width - (2*padding)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: padding, right: padding)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        
        let square = ( cellSize / CGFloat(sectionsCount) ) 
        layout.itemSize = CGSize(width:square , height: square  )
        self.collectionViewLayout = layout
        
        
    }
    
    

}


extension UIButton{
    
    
    var extras: Any! {
        
        get {
            return objc_getAssociatedObject(self, &extrasKey)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &extrasKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    var indexPath: IndexPath! {
        get {
            return objc_getAssociatedObject(self, &indexP) as! IndexPath!
        }
        set(newValue) {
            objc_setAssociatedObject(self, &indexP, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    var value: String! {
        get {
            return objc_getAssociatedObject(self, &val) as! String!
        }
        set(newValue) {
            objc_setAssociatedObject(self, &val, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    
}
