//
//  menuCell.swift
//  WLIDrawer-IOS
//
//  Created by WLI on 14/07/20.
//  Copyright © 2020 WLI. All rights reserved.
//

import UIKit

class menuCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
