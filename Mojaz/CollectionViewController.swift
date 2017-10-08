//
//  CollectionViewController.swift
//  Mojaz
//
//  Created by abuzeid on 9/26/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    fileprivate final let sectionsCount = 2
    fileprivate let cellId = "ImageCollectionCell"
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate let dataArray = {
        
        return [    CollectionDataModel(data: "https://r-ec.bstatic.com/images/hotel/max1024x768/750/75085333.jpg",width: 0.25),
                    CollectionDataModel(data: "https://cdn.pixabay.com/photo/2013/07/30/09/37/dog-168815_960_720.jpg",width:0.75),
                    CollectionDataModel(data: "https://www.jet2holidays.com/HotelImages/Web/FAO_75188_Villa_Damara_0317_01.jpg",width:0.30),
                    CollectionDataModel(data: "https://i.pinimg.com/736x/ae/de/57/aede573a9f034bd2402a336467b9b9e3--luxury-home-decor-luxury-homes.jpg",width:0.70),
                    CollectionDataModel(data: "https://www.villazzo.com/img/property/contenta/14_villa_contenta.jpg",width:0.50),
                    CollectionDataModel(data: "https://www.villazzo.com/img/property/contenta/14_villa_contenta.jpg",width:0.50),
                    CollectionDataModel(data: "https://r-ec.bstatic.com/images/hotel/max1024x768/750/75085333.jpg",width: 0.80),
                    CollectionDataModel(data: "https://cdn.pixabay.com/photo/2013/07/30/09/37/dog-168815_960_720.jpg",width:0.20),
                    CollectionDataModel(data: "https://www.jet2holidays.com/HotelImages/Web/FAO_75188_Villa_Damara_0317_01.jpg",width:0.60),
                    CollectionDataModel(data: "https://i.pinimg.com/736x/ae/de/57/aede573a9f034bd2402a336467b9b9e3--luxury-home-decor-luxury-homes.jpg",width:0.40),
                    CollectionDataModel(data: "https://www.villazzo.com/img/property/contenta/14_villa_contenta.jpg",width:0.50),
                    CollectionDataModel(data: "https://www.villazzo.com/img/property/contenta/14_villa_contenta.jpg",width:0.50)
        ]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.register(UINib(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: cellId)

    }
  
    
    
}

extension CollectionViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return Utils.numberOfItemsInSection(section: section, array: dataArray, sectionsCount: sectionsCount)
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:ImageCollectionCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCollectionCell;
        //cell.backgroundColor = .red
//        cell.iv.image = #imageLiteral(resourceName: "first")
        // cell.url = dataArray[indexPath.row].url
        return cell
        
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int{
       return Utils.numberOfSectionsInCollectionView(array: dataArray, sectionsCount: sectionsCount)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = (collectionView.frame.width)
        let position = Utils.itemPostionInArray(indexPath: indexPath, sectionsCount: sectionsCount)
        let percentage = dataArray[position].cellWidth
        let wi =  w * percentage
        
        print("cell \(position) width>>>\(wi)")
        return CGSize(width:  wi, height:  w)
        
    }
    
}



extension CollectionViewController: UICollectionViewDelegate{
    
}


class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var iv: UIImageView!
}

