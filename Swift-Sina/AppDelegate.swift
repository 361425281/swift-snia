//
//  AppDelegate.swift
//  Swift - sina
//
//  Created by 熊德庆 on 15/10/26.
//  Copyright © 2015年 熊德庆. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
      let  TabVC = DQTabBarController()
        window?.rootViewController = TabVC
         window?.makeKeyAndVisible()
        return true
    }

}

