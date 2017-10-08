//
//  StoryViewController.swift
//  Mojaz
//
//  Created by abuzeid on 9/30/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var videoLayout: UIView!
    @IBOutlet weak var storyImageView: UIImageView!
    
    
    
    
    
    
    var dataObject:ContentModel?
    var story :Story?
    
    let videoVC = Cuts.mvc(storyid: cids.videoPlayerController) as! VideoPlayerController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChildViewController(videoVC)
        
        self.view.addSubview(videoVC.view)
        videoVC.view.frame = videoVC.viewFrame
        
        self.videoLayout.sendSubview(toBack: videoVC.view)
        getDataRemotely()
        CachManager.manager.cancel()

        
       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
  
    
    
    func getDataRemotely(){
        Progress.show(sender: self.view)
        RequestManager.get(actionName: dataObject?.url ?? "", respo: { dictionary in
            
            self.story = Story.init(dictionary: dictionary as NSDictionary)
            self.startDownloadQueue()
            self.videoVC.story = self.story
            
        })
    }
    
    func startDownloadQueue(){
        
        
        if  let queue = self.story?.content{
            let urls = queue.map({$0.media_url})
            CachManager.manager.downloadQueue(files: urls as! [String])
        }
    }
    
    

    
    
    
    
}
