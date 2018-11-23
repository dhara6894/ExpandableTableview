//
//  BCell.swift
//  TableSectionWithExpand
//
//  Created by Dhara Patel on 23/11/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class BCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension BCell: ExpyTableViewHeaderCell{
    func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {
        
        switch state {
        case .willExpand:
            arrowDown(animated: !cellReuse)
        case .willCollapse:
            arrowRight(animated: !cellReuse)
        case .didExpand:
            break
        case .didCollapse:
            break
        }
    }
    
    private func arrowDown(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0)) {
            
        }
    }
    
    private func arrowRight(animated: Bool) {
        UIView.animate(withDuration: (animated ? 0.3 : 0)) {
//            self.arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
}
