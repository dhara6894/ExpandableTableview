//
//  ButtonSelectionCell.swift
//  TableSectionWithExpand
//
//  Created by Dhara Patel on 23/11/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

protocol ButtonSelectionDelegate {
    func aSelected()
    func bSelected()
}
class ButtonSelectionCell: UITableViewCell {

    @IBOutlet var AButton: UIButton!
    @IBOutlet var BButton: UIButton!
    var delegate: ButtonSelectionDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func AButtonTapped(_ sender: Any) {
        
        delegate?.aSelected()
    }
    @IBAction func BButtonTapped(_ sender: Any) {
        delegate?.bSelected()
    }
    
}
