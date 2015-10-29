//
//  DQTabBarController.swift
//  Swift - sina
//
//  Created by 熊德庆 on 15/10/26.
//  Copyright © 2015年 熊德庆. All rights reserved.
//

import UIKit

class DQTabBarController: UITabBarController
{
    override func viewDidLoad()
    {
//        let  newTabBar = DQTabBar()
//        newTabBar.composeButton.addTarget(self, action: "composeButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        setValue(newTabBar, forKey: "tabBar")
        
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.orangeColor()
        
        let  HomeVC = DQHomeTabBarController()
         self.addChildViewController(HomeVC, title: "首页", imagename: "tabbar_home")
        
        let  MessageVC = DQMessageTableViewController()
        self.addChildViewController(MessageVC, title: "信息", imagename: "tabbar_message_center")
        
        let  add = UIViewController()
        self.addChildViewController(add, title: "", imagename: "f")
        
        let  DiscoveVC = DQDiscoverTabBarController()
        self.addChildViewController(DiscoveVC, title: "发现", imagename: "tabbar_discover")
        
        let  MeVC = DQMeTableViewController()
        MeVC.title = "我"
        self.addChildViewController(MeVC, title: "我", imagename: "tabbar_profile")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let  width  = tabBar.bounds.width / CGFloat(5)
        composeButton.frame = CGRectMake(width*2, 0, width, tabBar.bounds.height)
        tabBar.addSubview(composeButton)
    }
        private  func  addChildViewController(Controller:UIViewController,title:String,imagename:String)
        {
          Controller.title = title
       Controller.tabBarItem.image = UIImage(named: imagename)
        addChildViewController(UINavigationController(rootViewController: Controller))
    }
    //懒加载
    lazy var composeButton:UIButton = {
        let btn=UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
       btn.addTarget(self, action: "composeButton", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
        }()
}
