//
//  ScalableViewController.swift
//  iOS Gestures
//
//  Created by abuzeid on 9/29/17.
//  Copyright © 2017 aone. All rights reserved.
//

import UIKit

class ScalableViewController: UIViewController {
    
    @IBOutlet weak var rootView: UIView!
    var videoScaled = false
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var videoLayout: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       calculateLayouts()
        updateVideoUI()
    }
    func calculateLayouts(){
    let titleH = videoScaled ?  self.rootView.frame.height * 0.1 : 0
    
    let newframe = CGRect(x: self.titleView.frame.origin.x, y: self.titleView.frame.origin.y, width: self.rootView.frame.width, height: titleH)
    self.titleView.frame = newframe
    
    let vWidth = videoScaled ? self.rootView.frame.width * 0.9 : self.rootView.frame.width
    let vH = videoScaled ? self.rootView.frame.height * 0.85 : self.rootView.frame.height  - titleH
    
    let newx = videoScaled ? self.rootView.frame.width * 0.05 : 0
    let newy = videoScaled ? self.rootView.frame.height * 0.1 : titleH
    
    
    let vframe = CGRect(x: newx , y: newy, width: vWidth, height: vH)
    
    
    
    self.videoLayout.frame = vframe
    
    
    
    }
    
    @IBAction func scaleAction(_ sender: Any) {
        videoScaled = !videoScaled
        print(videoScaled)
        scaleToCenter(mili: 2000)
        
    
    
    }
    func updateVideoUI(){
        if videoScaled {
            
        
        self.videoLayout.layer.cornerRadius = 12
        }else{
            self.videoLayout.layer.cornerRadius = 0
        }
        self.videoLayout.clipsToBounds = true
    }
    
    
    func scaleToCenter(mili:Float){
        
        
        UIView.animate(withDuration: TimeInterval(mili / 1000), delay: 0 , options: [], animations: {
           self.calculateLayouts()
            self.updateVideoUI()
            
        }, completion: { Void in
            // self.translateiv.center.x =  oldX
            self.viewWillLayoutSubviews()

        })
        
    }
    
    
    
    
}
