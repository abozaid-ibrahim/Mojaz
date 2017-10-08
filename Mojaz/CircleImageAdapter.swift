//
//  CircleImageAdapter.swift
//  Mojaz
//
//  Created by abuzeid on 9/26/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import Foundation
import UIKit



class CicleImageAdapter:NSObject, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    fileprivate var cellId:String
    fileprivate final let sectionsCount = 1
    var dataArray:[AnyObject]
    
    init(cellId:String,data:[AnyObject]) {
    
        self.dataArray = data
        self.cellId = cellId
        
    }
    func updatee( c: UICollectionView){
        c.dataSource = self
        c.reloadData()
    }
    
    

    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return Utils.numberOfItemsInSection(section: section, array: dataArray, sectionsCount: sectionsCount)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:CicleImageCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CicleImageCollectionCell;
        
        return cell
        
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int{
        return Utils.numberOfSectionsInCollectionView(array: dataArray, sectionsCount: sectionsCount)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = (collectionView.frame.width / 2)
        
        return CGSize(width:  w, height:  w)
        
    }
    
}



extension CicleImageAdapter: UICollectionViewDelegate{
    
}
