//
//  CicleImageCollectionCell.swift
//  Mojaz
//
//  Created by abuzeid on 9/26/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit

class CicleImageCollectionCell: UICollectionViewCell {

    @IBOutlet weak var cImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }

    
    func setupUI(){
        self.cImageView.layer.borderWidth = 1
        self.cImageView.layer.borderColor = UIColor.white.cgColor
        self.cImageView.layer.cornerRadius = self.cImageView.frame.height / CGFloat(2.0)
        self.cImageView.layer.masksToBounds = true
    }
    
}
