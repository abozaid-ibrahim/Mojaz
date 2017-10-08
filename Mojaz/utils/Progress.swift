//
//  Progress.swift
//  Super Market
//
//  Created by mac on 11/23/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import ARSLineProgress

var counter = 0

class Progress{
    
    
    static func show(sender:AnyObject){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        showInfiniteLoader(sender)
        
    }
    
    static func hide(){
        // counter -= 1
       // if counter == 0  {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            ARSLineProgress.hide()
       // }
        }
    }
}


let maxLoadDuration = 60.0


func showInfiniteLoader(_ sender: AnyObject) {
    if ARSLineProgress.shown { return }
  //  counter += 1
    ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
        print("Showed with completion block")
    }
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64( maxLoadDuration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: { () -> Void in
        ARSLineProgress.hideWithCompletionBlock({ () -> Void in
            print("Hidden with completion block")
            counter = counter - 1
        })
    })
}



//func showProgressWithoutAnimation(_ sender: AnyObject) {
//    if ARSLineProgress.shown { return }
//
//    ARSLineProgressConfiguration.showSuccessCheckmark = false
//
//    progressObject = Progress(totalUnitCount: 100)
//    ARSLineProgress.showWithProgressObject(progressObject!, completionBlock: {
//        print("Success completion block")
//        ARSLineProgressConfiguration.restoreDefaults()
//    })
//
//    //progressDemoHelper(success: true)
//}
//


/*
 
 func getDataFromServer() {
 
 if isSuccess == false && progressObject?.fractionCompleted >= 0.7 {
 ARSLineProgress.cancelPorgressWithFailAnimation(true, completionBlock: {
 print("Hidden with completion block")
 })
 return
 } else {
 if progressObject?.fractionCompleted >= 1.0 { return }
 }
 
 
 
 }
 
 
 // MARK: In case you want, you can use regular CGFloat value with showWithProgress(initialValue: 1.0) method.
 
 func showProgressLoaderWithSuccess(_ sender: AnyObject) {
 if ARSLineProgress.shown { return }
 
 progressObject = Progress(totalUnitCount: 100)
 ARSLineProgress.showWithProgressObject(progressObject!, completionBlock: {
 print("Success completion block")
 })
 
 //progressDemoHelper(success: true)
 }
 func didTapShowSuccessButton(_ sender: AnyObject) {
 ARSLineProgress.showSuccess()
 }
 
 func didTapShowFailButton(_ sender: AnyObject) {
 ARSLineProgress.showFail()
 }
 
 func showFullBackgroundLoader(_ sender: AnyObject) {
 if ARSLineProgress.shown { return }
 //
 //    ARSLineProgressConfiguration.backgroundViewStyle = .full
 //    ARSLineProgressConfiguration.backgroundViewColor = UIColor.white.cgColor
 //    ARSLineProgressConfiguration.backgroundViewDismissTransformScale = 1
 //
 //    ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
 //        print("Showed with completion block")
 //    }
 //
 //    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: { () -> Void in
 //        ARSLineProgress.hideWithCompletionBlock({ () -> Void in
 //            print("Hidden with completion block")
 //
 //            ARSLineProgressConfiguration.restoreDefaults()
 //        })
 //    })
 //}
 }
 
 
 
 // MARK: Helper Demo Methods
 private var progressObject: Progress?
 private var isSuccess: Bool?
 
 extension HomeViewController {
 
 fileprivate func progressDemoHelper(success: Bool) {
 isSuccess = success
 ars_launchTimer()
 }
 
 fileprivate func ars_launchTimer() {
 let dispatchTime = DispatchTime.now() + Double(Int64(0.7 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC);
 
 DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
 progressObject!.completedUnitCount += Int64(arc4random_uniform(30))
 
 if isSuccess == false && progressObject?.fractionCompleted >= 0.7 {
 ARSLineProgress.cancelPorgressWithFailAnimation(true, completionBlock: {
 print("Hidden with completion block")
 })
 return
 } else {
 if progressObject?.fractionCompleted >= 1.0 { return }
 }
 
 self.ars_launchTimer()
 })
 }
 
 }
 
 fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
 switch (lhs, rhs) {
 case let (l?, r?):	return l < r
 case (nil, _?):		return true
 default:			return false
 }
 }
 
 fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
 switch (lhs, rhs) {
 case let (l?, r?):	return l >= r
 default:			return !(lhs < rhs)
 }
 }*/






//
//        let ringProgressView = MKRingProgressView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
//        ringProgressView.startColor = .red
//        ringProgressView.endColor = .magenta
//        ringProgressView.ringWidth = 25
//        ringProgressView.progress = 0.0
//
//        view.addSubview(ringProgressView)

//        if ARSLineProgress.shown { return }
//
//        let progressObject = Progress(totalUnitCount: 100)
//        ARSLineProgress.showWithProgressObject(progressObject, completionBlock: {
//            print("Success completion block")
//        })

//progressDemoHelper(success: true)


// Do any additional setup after loading the view.



//  if ARSLineProgress.shown { return }


// progressDemoHelper(success: true)
