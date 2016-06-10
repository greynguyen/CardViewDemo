//
//  PageMenu.swift
//  CardView
//
//  Created by Duong Nguyen on 10/06/2016.
//  Copyright © 2016 Oliu. All rights reserved.
//

import Foundation
import PageMenu

class PageMenu: UIViewController, CAPSPageMenuDelegate, HideNavBarDelegate {
    
    @IBOutlet var Open: UIBarButtonItem!
    
    // create a page variable
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        // create an array to hold all the view controllers
        var controllerArray : [UIViewController] = []
        
        // get path to view controllers and append it to the array
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PageMenu") as UIViewController
        controllerArray.append(viewController)
        
        let viewController2: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PageMenu2") as UIViewController
        controllerArray.append(viewController2)

        // set up the look of the menu
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(0),
            .UseMenuLikeSegmentedControl(true),
            .SelectionIndicatorColor(UIColor(red:0.59, green:0.57, blue:0.22, alpha:1.00)),
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .SelectedMenuItemLabelColor(UIColor.blackColor()),
            .MenuHeight(60),
            .ScrollAnimationDurationOnMenuItemTap(150),
            .BottomMenuHairlineColor(UIColor(red:0.59, green:0.57, blue:0.22, alpha:0))
        ]
        
        // get height of status bar and nav bar
        let navBarHeight = navigationController?.navigationBar.frame.size.height
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let PageMenuY = navBarHeight! + statusBarHeight
        
        // place the menu on the view controller
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, PageMenuY, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
        
        // add delegate to self
        pageMenu!.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func willMoveToPage(controller: UIViewController, index: Int) {
        if index == 2 {
            
        }
    }
    
    func hideBar(controller: ViewController) {
//        self.navigationController?.navigationBarHidden = true
    }
    
    func unhideBar(controller: ViewController) {
//        self.navigationController?.navigationBarHidden = false
    }
}
