//
//  SideMenuTableCell.swift
//  Mojaz
//
//  Created by abuzeid on 9/25/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit

class SideMenuTableCell: UITableViewCell {

    @IBOutlet weak var iconiv: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
