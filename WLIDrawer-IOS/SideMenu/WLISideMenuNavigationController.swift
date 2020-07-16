//
//  RootNavigationViewController.swift
//  WLISideMenu
//
//  Created by WLI on 14/07/20.
//  Copyright © 2020 WLI. All rights reserved.
//

import UIKit

open class WLISideMenuNavigationController: UINavigationController, WLISideMenuProtocol {

    open var sideMenu : WLISideMenu?
    open var sideMenuAnimationType : WLISideMenuAnimation = .default


    // MARK: - Life cycle
    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    public init( menuViewController: UIViewController, contentViewController: UIViewController?) {
        super.init(nibName: nil, bundle: nil)

        if (contentViewController != nil) {
            self.viewControllers = [contentViewController!]
        }

        sideMenu = WLISideMenu(sourceView: self.view, menuViewController: menuViewController, menuPosition:.left)
        view.bringSubviewToFront(navigationBar)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    open func setContentViewController(_ contentViewController: UIViewController) {
        self.sideMenu?.toggleMenu()
        switch sideMenuAnimationType {
        case .none:
            self.viewControllers = [contentViewController]
            break
        default:
            contentViewController.navigationItem.hidesBackButton = true
            self.setViewControllers([contentViewController], animated: true)
            break
        }

    }

}
