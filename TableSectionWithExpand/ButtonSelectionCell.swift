//
//  ButtonSelectionCell.swift
//  TableSectionWithExpand
//
//  Created by Dhara Patel on 23/11/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class ButtonSelectionCell: UITableViewCell {

    @IBOutlet var AButton: UIButton!
    @IBOutlet var BButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func AButtonTapped(_ sender: Any) {
    }
    @IBAction func BButtonTapped(_ sender: Any) {
    }
    
}
