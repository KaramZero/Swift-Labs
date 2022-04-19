//
//  MyTableViewCell.swift
//  FriendApp UITableViewCell
//
//  Created by Karam Ibrahim on 4/19/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var ageLBL: UILabel!
    @IBOutlet var imageV: UIImageView!
    @IBOutlet var nameLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
