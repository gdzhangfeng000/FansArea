//
//  DetailTableViewCell.swift
//  FansArea
//
//  Created by 123 on 2017/6/4.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var FiledLable: UILabel!
    
    @IBOutlet weak var ValueLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
