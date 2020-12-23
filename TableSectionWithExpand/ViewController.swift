//
//  ViewController.swift
//  TableSectionWithExpand
//
//  Created by Dhara Patel on 23/12/20.
//  Copyright © 2020 Solution Analysts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expandableTableView: ExpyTableView!
    
    
    let cars = [["SWIFT", "BALENO", "ALTO", "CIAZ"], ["INNOVA", "GLANZA", "FORTUNER"] , ["BMW X5", "BMW M4", "BMW 7 Series", "BMW X7", "BMW i3"]]

    let brand = ["MARUTHI", "TOYOTA", "BMW"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK:- ExpyTableViewDataSource method
extension ViewController: ExpyTableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return brand.count
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as? TitleTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = brand[section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars[section].count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell") as? DetailTableViewCell else {
            return UITableViewCell()
        }
        cell.detailLabel.text = "\(indexPath.row)." + " " + cars[indexPath.section][indexPath.row - 1]
        return cell
    }
}


//MARK:- ExpyTableViewDelegate method
extension ViewController: ExpyTableViewDelegate {
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return indexPath.row == 0 ? 105 : 450
//    }
    
}
