        
        
        //
        //  BaseViewController.swift
        //  Abuzeid Ibrahim project
        //@in/abuzeid.ibarhim
        //  Created by mac on 11/19/16.
        //  Copyright © 2016 mac. All rights reserved.
        //
        
        import UIKit
        import Kingfisher
        
        class BaseViewController: UIViewController  , UITabBarDelegate , UITextFieldDelegate,UIPopoverPresentationControllerDelegate {
            
            let imagePicker = UIImagePickerController()
            
            lazy var toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(dismissPickerView))
            lazy var  pickerView = UIPickerView()
            func dismissPickerView(sender:Any){
                self.pickerView.endEditing(true)
            }
            func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
                return .none
            }
            
            
            
            
            override func viewDidLoad() {
                super.viewDidLoad()
                //                NotificationCenter.default.addObserver(self, selector: #selector(updateCartCount), name:NSNotification.Name(rawValue: constants.notify_cartCount), object: nil)
                
                setAppFont(sender: self.view)
                if L102Language.currentAppleLanguage() == "ar" {
                    loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: self.view.subviews)
                }
                
            }
            
            
            
            
            func resizeForKeypad(){
                NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            }
            
            func keyboardWillShow(notification: NSNotification) {
                if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                    if self.view.frame.origin.y == 0{
                        self.view.frame.origin.y -= keyboardSize.height
                    }
                }
            }
            
            func keyboardWillHide(notification: NSNotification) {
                if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                    if self.view.frame.origin.y != 0 {
                        self.view.frame.origin.y += keyboardSize.height
                    }
                }
            }
            
            
            deinit {
                NotificationCenter.default.removeObserver(self)
            }
            
            
            func pickImage(sender:Any){
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true, completion: nil)
            }
            
            
            
            
            
            // Hide the keyboard when the return key pressed
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                textField.resignFirstResponder()
                return true
            }
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
