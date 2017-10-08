//
//  CollectionDataModel.swift
//  Mojaz
//
//  Created by abuzeid on 9/26/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit

 class CollectionDataModel {
    var data:String
    //percentage of cell width
    var cellWidth:CGFloat
    init(data:String,width:CGFloat) {
        self.data = data
        self.cellWidth = width
    }

}
