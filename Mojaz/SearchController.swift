//
//  SearchController.swift
//  Mojaz
//
//  Created by abuzeid on 9/26/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit

private let postsReuseIdentifier = "ImageCollectionCell"
private let usersReuseIdentifier = "circle_cell"

class SearchController: UIViewController {


    //fileprivate final var userSectionsCount = 1
    
    fileprivate final let postSectionsCount = 2
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    @IBOutlet weak var postsCollectionView: UICollectionView!
    fileprivate final var layout = UICollectionViewFlowLayout()
    fileprivate let users:[AnyObject] =   DummyData.users
    
    fileprivate final var dataArray = [ContentModel]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollections()
        getDataRemotely()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.usersCollectionView.reloadData()

    }
    func initCollections(){
        self.postsCollectionView.register(UINib(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: postsReuseIdentifier)
       
        
    
        
        let nib = UINib(nibName: "CicleImageCollectionCell", bundle: nil)
        self.usersCollectionView.register(nib, forCellWithReuseIdentifier: usersReuseIdentifier)
        self.usersCollectionView.layoutMargins = .zero
        
        
        layout.sectionInset = .zero//UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let w = usersCollectionView.frame.height * 0.75
        
        layout.itemSize = CGSize(width: w, height: w)
        layout.minimumInteritemSpacing =  0
        layout.minimumLineSpacing = w / 3
        layout.scrollDirection = .horizontal
        self.usersCollectionView!.collectionViewLayout = layout
        
        
        
        
    }
    func getDataRemotely(){
        Progress.show(sender: self.view)
        RequestManager.get(actionName: constants.st, respo: { dictionary in
//              if let json = dictionary["categories"]  as? NSArray{//
            if let json = dictionary["content"]  as? NSArray{//
            self.dataArray = ContentModel.modelsFromDictionaryArray(array: json)
            }
            self.postsCollectionView.reloadData()
         })
    }
    
}




extension SearchController:UICollectionViewDelegateFlowLayout{
    
 
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        switch collectionView {
        case self.usersCollectionView:
       return layout.itemSize
        case self.postsCollectionView:
            let position = Utils.itemPostionInArray(indexPath: indexPath, sectionsCount: postSectionsCount)
            let w = collectionView.frame.width / 2 //* dataArray[position].cellWidth
            
            return CGSize(width:  w,
                          height:  collectionView.frame.width)
            
        default:
            return CGSize(width: CGFloat(0), height: CGFloat(0))
        }
        
        
        
        
    }
}
extension SearchController: UICollectionViewDataSource{
   
    
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int{
        
        switch collectionView {
        case self.usersCollectionView:
            return  1//Utils.numberOfSectionsInCollectionView(array: users, sectionsCount: userSectionsCount)
        case self.postsCollectionView:
            return Utils.numberOfSectionsInCollectionView(array: dataArray, sectionsCount: postSectionsCount)
            
        default:
            return 0
        }
        
        
        
        
        
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        switch collectionView {
        case self.usersCollectionView:
            return users.count//Utils.numberOfItemsInSection(section: section, array: users, sectionsCount: userSectionsCount)
        case self.postsCollectionView:
            return Utils.numberOfItemsInSection(section: section, array: dataArray, sectionsCount: postSectionsCount)

        default:
            return 0
        }
        
    }
    
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        switch collectionView {
        case self.usersCollectionView:
            
            let cell:CicleImageCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: usersReuseIdentifier, for: indexPath) as! CicleImageCollectionCell
             cell.setupUI()
           cell.cImageView.image = #imageLiteral(resourceName: "trika")
          
            return cell
            
        
        case self.postsCollectionView:
            
            let cell:ImageCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: postsReuseIdentifier, for: indexPath) as! ImageCollectionCell
            let object  = dataArray[Utils.itemPostionInArray(indexPath: indexPath, sectionsCount: postSectionsCount)]
            cell.imgView.webImage(url: object.avatar ?? "")
            return cell
            
        default:
            return UICollectionViewCell()
        }

        
        
        
    }
  
   
        
    
    
    
}



extension SearchController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let position = Utils.itemPostionInArray(indexPath: indexPath, sectionsCount: postSectionsCount)
        let video = Cuts.mvc(storyid: cids.videoPlayerController) as! VideoPlayerController
        //video.cat = dataArray[position]
//        self.navigationController?.pushViewController(video, animated: true)
        
        
        
        let story = StoryViewController()
        story.dataObject = dataArray[position]
        present(story, animated: true, completion: nil)

    }
}





