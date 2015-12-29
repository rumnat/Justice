//
//  ViewController.swift
//  Justice
//
//  Created by Anton Muratov on 12/11/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit


class JBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Menu button settings
        if self.revealViewController() != nil {
            let leftBatButtonItemImage = UIImage(named: ApplicationImages.Icons.MenuIcon);
            let leftBarButtonItem = UIBarButtonItem(image: leftBatButtonItemImage,
                style: UIBarButtonItemStyle.Plain,
                target: self.revealViewController(),
                action: "revealToggle:")
            
            leftBarButtonItem.tintColor = UIColor.whiteColor()
            
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.setupNavigationBar()
        self.setupStatusBar()
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.colorWithHexString(ApplicationColors.NavigationBarColor)
        
        // Navigation title font and color of the font
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: Fonts.Helvetica, size: 18.0)!
        ]
    }
    
    private func setupStatusBar() {
        let statusBarFrame = CGRectMake(0.0, -20.0, UIScreen.mainScreen().bounds.size.width, 20.0)
        
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = UIColor.colorWithHexString(ApplicationColors.StatusBarColor)
        
        self.navigationController?.navigationBar.addSubview(statusBarView)
    }
}

