//
//  SideMenuTableViewController.swift
//  Justice
//
//  Created by Anton Muratov on 12/13/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка бокового меню
        self.view.backgroundColor = UIColor.colorWithHexString(ApplicationColors.NavigationBarColor)
        self.setupStatusBar()
    }
    
    private func setupStatusBar() {
        // Настройка статус бара для бокового меню
        let statusBarFrame = CGRectMake(0, -20.0, UIScreen.mainScreen().bounds.size.width, 20.0)
        
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = UIColor.colorWithHexString(ApplicationColors.StatusBarColor)
        
        self.view.addSubview(statusBarView)
    }
}
