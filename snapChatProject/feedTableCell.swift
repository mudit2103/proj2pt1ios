//
//  feedTableCell.swift
//  snapChatProject
//
//  Created by Mudit Gupta on 3/10/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class feedTableCell: UITableViewCell {

    @IBOutlet weak var feedTableCellLabel: UILabel!
    @IBOutlet weak var seenImage: UIImageView!
    @IBOutlet weak var timeElapsed: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
