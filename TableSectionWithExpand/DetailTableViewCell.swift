//
//  DetailTableViewCell.swift
//  TableSectionWithExpand
//
//  Created by Dhara Patel on 23/12/20.
//  Copyright © 2020 Solution Analysts. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
