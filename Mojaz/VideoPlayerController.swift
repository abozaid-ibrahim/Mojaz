//
//  VideoPlayerController.swift
//  Mojaz
//
//  Created by abuzeid on 9/27/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerController:  AVPlayerViewController,AVPlayerViewControllerDelegate{
    var headerFrame:CGRect?
    var videoScaled = false
    final var animTime =  TimeInterval(0.3)
    final var currentIndex  = 0 {
        didSet{
            cachNextFiles()
        }
    }
    var data = [String]()
    
    var story:Story?{
        didSet{
            if  let queue = self.story?.content{
                self.data = queue.map({$0.media_url! })
                if let first = queue.first{
                    self.setCurrentMedia(object: first)
                }
            }
        }
    }
    
    
    
    
    @IBOutlet weak var customControllsView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        initPlayerView()
         Progress.show(sender: self.view)
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(note:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
    
    
    var viewFrame = CGRect(x:0,y:UIApplication.shared.statusBarFrame.height,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.customControllsView.frame = viewFrame
        
        self.view.addSubview(customControllsView)
        self.view.bringSubview(toFront: customControllsView)
        
    }
    
    func setStoryImage(url:String){
        if let _url = URL(string:url)  {
            self.storyImageView.isHidden  = false
            self.storyImageView.kf.setImage(with: _url)        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var optionsView: UIView!
    
}
// PLAYER CONTROLS
extension VideoPlayerController{
    
    
    func cachNextFiles(){
        let newIndex = CachManager.manager.maxdStackNum + currentIndex
        if  newIndex < self.data.count{
            
            if !CachManager.manager.isFileCached(url: self.data[newIndex]){
                CachManager.manager.addItemToDownloadQueue(urlString: self.data[newIndex])
                
            }
            
            
        }
    }
    func initPlayerView(){
        self.showsPlaybackControls = false
        self.videoGravity = AVLayerVideoGravityResizeAspectFill
    }
    func loadFileLocally(){
        if let path = Bundle.main.path(forResource: "watch", ofType: "mp4"){
            // let videoURL = NSURL(fileURLWithPath: path)
            //self.player = AVPlayer(url:URL(string:path)!)
            if self.player == nil {
                self.player = AVPlayer(url:NSURL(fileURLWithPath:path) as URL)
            }
            self.playVideoItem(path:path)
        }
    }
    
    
    func playVideoItem(path:String){
        if self.player == nil {
            self.player = AVPlayer(url:NSURL(fileURLWithPath:path) as URL)
        }
        print("play \(path)")
        
        let fileUrl = URL(fileURLWithPath:path)
        let playerItem = AVPlayerItem(url:fileUrl)
        player?.replaceCurrentItem(with: playerItem)
        player?.play()
    }
    
    
    func setCurrentMedia(object:Content){
        
        switch object.media_type! {
        case mediaType.images.rawValue:
            
            if let url = object.png_file{
                self.setStoryImage(url:url )
            }else if let media = object.media_url{
                self.setStoryImage(url:media )
                
            }
            
            
        case mediaType.imageAndVideo.rawValue:
            if let url = object.png_file{
                self.setStoryImage(url:url )
            }
            
            CachManager.manager.getFile(url: object.media_url!, filePath: { path in
                
                self.playVideoItem(path:path)
                
            })
            
        case mediaType.video.rawValue:
            self.storyImageView.isHidden = true
            CachManager.manager.getFile(url: object.media_url!, filePath: { path in
                
                self.playVideoItem(path:path)
            })
            
        default:
            print("non registered case")
        }
        
        
        
        
        
        
        
    }
    
    func nextVideo(){
        if currentIndex ==  data.count - 1{
            self.storyCompleted()
            return
        }
        currentIndex += 1
        guard  let array = self.story?.content else {
            return
        }
        self.setCurrentMedia(object: array[currentIndex])
    }
    
    func prevVideo(){
        if currentIndex <= 0 {
            self.storyCompleted()
            return
        }
        currentIndex -= 1
        guard  let array = self.story?.content else {
            return
        }
        self.setCurrentMedia(object: array[currentIndex])
        
    }
    
    func storyCompleted(){
        print("file storyCompleted done..")
        print("position is \(currentIndex) size is \(data.count)")
        
        dimissVC()
    }
    func dimissVC(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func resume(){
        player?.play()
        
    }
    func pause(){
        player?.pause()
        
    }
    
    func stopPrevMedia(){
        pause()
    }
    
    
    
    
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
        nextVideo()
    }
    
}
// IB ACTIONS
extension VideoPlayerController{
    @IBAction func playPauseAction(_ sender: Any) {
        guard let videos = self.story?.content else {
            return
        }
        if videos[currentIndex].media_type == mediaType.images.rawValue {
            return
        }
        
        if ((self.player?.rate != 0) && (self.player?.error == nil)) {
            self.pause()
        }else{
            self.resume()
        }
    }
    @IBAction func nextAction(_ sender: Any) {
        stopPrevMedia()
        nextVideo()
        
        
    }
    
    @IBAction func previousAction(_ sender: Any) {
        stopPrevMedia()
        self.prevVideo()
        // self.loadFileLocally()
    }
    
    @IBAction func swipeDownToDismiss(_ sender: UISwipeGestureRecognizer) {
        print("pop controller.....");
        dimissVC()
    }
    
    @IBAction func optionsAction(_ sender: Any) {
        videoScaled = !videoScaled
        print(videoScaled)
        self.startAnimationGroup()
    }
    
}
//Animation
extension VideoPlayerController{
    
    
    
    func calculateLayouts(){
        
        
        let titleH = videoScaled ?  viewFrame.height * 0.1 : 0
        
        
        
        //        self.titleView.frame = newframe
        
        let vWidth = videoScaled ? viewFrame.width * 0.9 : viewFrame.width
        let vH = videoScaled ? viewFrame.height * 0.85 : viewFrame.height  - titleH
        
        let newx = videoScaled ? viewFrame.width * 0.05 : 0
        let newy = videoScaled ? viewFrame.height * 0.1 : titleH
        
        
        let vframe = CGRect(x: newx , y: newy, width: vWidth, height: vH  )
        let oH = CGFloat(50)
         let oframe = CGRect(x: 0 , y: vframe.height - (oH + UIApplication.shared.statusBarFrame.height), width: vframe.width, height: oH  )
        self.optionsView.frame = oframe
        self.view.frame = vframe
        
    }
    
 
    func updateVideoUI(){
        if videoScaled {
           self.view.layer.cornerRadius = 12
            self.optionsView.isHidden = false

        }else{
            self.view.layer.cornerRadius = 0
        }
        self.view.clipsToBounds = true

    }
    
    func startAnimationGroup(){
        scaleToCenter()
        fadeOptions(fadein:videoScaled )
    }
    func scaleToCenter(){
        
        UIView.animate(withDuration: animTime, delay: 0 , options: [], animations: {
            self.calculateLayouts()
            self.updateVideoUI()
        }, completion: { Void in
            
        })
        
    }
    
    func fadeOptions(fadein:Bool){
        self.optionsView.alpha = fadein ? 0.3 : 1
        UIView.animate(withDuration: animTime, delay: 0 , options: [], animations: {
            self.optionsView.alpha = fadein ? 1: 0.0
        }, completion: { Void in
            self.optionsView.isHidden = !fadein
        })
        
    }
    
    
}
