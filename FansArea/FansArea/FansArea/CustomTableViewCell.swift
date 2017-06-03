//
//  CustomTableViewCell.swift
//  FansArea
//
//  Created by Zhang Feng on 2017/5/24.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var provinceLable: UILabel!
    @IBOutlet weak var partLable: UILabel!

    @IBOutlet weak var thumbImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
