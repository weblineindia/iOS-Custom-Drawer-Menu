//
//  ViewController.swift
//  WLISideMenu
//
//  Created by WLI on 14/07/20.
//  Copyright ©  2020 WLI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleSideMenuBtn(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
}


extension ViewController: WLISideMenuDelegate{
    // MARK: - ENSideMenu Delegate
       func sideMenuWillOpen() {
           print("sideMenuWillOpen")
       }
       
       func sideMenuWillClose() {
           print("sideMenuWillClose")
       }
       
       func sideMenuShouldOpenSideMenu() -> Bool {
           print("sideMenuShouldOpenSideMenu")
           return true
       }
       
       func sideMenuDidClose() {
           print("sideMenuDidClose")
       }
       
       func sideMenuDidOpen() {
           print("sideMenuDidOpen")
       }
}
