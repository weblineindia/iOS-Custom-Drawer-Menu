//
//  MyMenuTableViewController.swift
//  WLISideMenu
//
//  Created by WLI on 14/07/20.
//  Copyright © 2020 WLI. All rights reserved.
//

import UIKit

class MyMenuTableViewController: UITableViewController {
    
    private let menuOptionCellId = "menuCell"
    var selectedMenuItem : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: menuOptionCellId, bundle: nil), forCellReuseIdentifier: menuOptionCellId)

        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsets(top: 64.0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        clearsSelectionOnViewWillAppear = false
        
        // Preselect a menu option
        tableView.selectRow(at: IndexPath(row: selectedMenuItem, section: 0), animated: false, scrollPosition: .middle)
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: menuOptionCellId, for: indexPath) as! menuCell

//        cell.iconView.isHidden = true
        if indexPath.row == 0 {
            cell.lblTitle?.text = "First View"
        }else if indexPath.row == 1{
            cell.lblTitle?.text = "Second View"
        }else{
            cell.lblTitle?.text = "Other View"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("did select row: \(indexPath.row)")
        
        if (indexPath.row == selectedMenuItem) {
            sideMenuController()?.sideMenu?.hideSideMenu()
            return
        }
        
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        switch (indexPath.row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController")
            destViewController.title = "First View"
            break
        case 1:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController1")
            destViewController.title = "Second View"
            break
        default:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController1")
            destViewController.title = "Other View"
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }
    
}
