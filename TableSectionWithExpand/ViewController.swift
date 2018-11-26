//
//  ViewController.swift
//  TableSectionWithExpand
//
//  Created by Dhara Patel on 23/11/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableview: ExpyTableView!
    
    var isAselected = true
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.estimatedRowHeight = 100
        tableview.rowHeight =  UITableViewAutomaticDimension
        tableview.expandingAnimation = .fade
        tableview.collapsingAnimation = .fade
    }
}

extension ViewController: ButtonSelectionDelegate{
    func aSelected() {
        isAselected = true
        tableview.reloadData()
    }
    func bSelected() {
        isAselected = false
        tableview.reloadData()
    }
}
extension ViewController: ExpyTableViewDataSource {
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        if section >= 3 && !isAselected{
            return true
        }
        return false
    }
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        if section >= 3 && !isAselected{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BCell") as? BCell else { return UITableViewCell() }
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return isAselected ? 4 : (3 + 5)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 5
        case 2:
            return 1
       case _ where section >= 3:
            return isAselected ? 6 : 2
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MerchantCell", for: indexPath) as? MerchantCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonSelectionCell", for: indexPath) as? ButtonSelectionCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case _ where indexPath.section >= 3:
            if isAselected{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ACell", for: indexPath) as? ACell else { return UITableViewCell() }
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "BDetailCell", for: indexPath) as? BDetailCell else { return UITableViewCell() }
                cell.descLabel.text = "Ukraine's navy had accused Russia of the unprecedented incident including firing on its vessels in the Kerch Strait, a narrow waterway that gives access to the Sea of Azov that is used by Ukraine and Russia."
                return cell
            }
        default:
         return UITableViewCell()
        }
    }
}
//MARK: ExpyTableView delegate methods
extension ViewController : ExpyTableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 60
        case 2:
            return 50
         case _ where indexPath.section >= 3:
            return isAselected ? 90 : (indexPath.row == 0 ? 70 : UITableViewAutomaticDimension)
        default:
              return 50
        }
    }
}
