
//
//  DQBaseTableViewController.swift
//  Swift - sina
//
//  Created by 熊德庆 on 15/10/26.
//  Copyright © 2015年 熊德庆. All rights reserved.
//
import UIKit
class DQBaseTableViewController: UITableViewController
{
    let  userLogin = false
    override func loadView()
    {
        userLogin ? super.loadView():setupVistorView()
    }
    
    func  setupVistorView()
    {
        let vistorView = DQVistorView()
        view = vistorView
        //设置代理
        //vistorView.vistorViewDelegate = self
        view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "vistorViewRegistClick()")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style:UIBarButtonItemStyle.Plain, target: self, action: "vistorViewLoginClick()")
        if  self is DQHomeTabBarController
        {
            vistorView.startRotationAnimation()
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didEnterBackground", name: UIApplicationDidEnterBackgroundNotification, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBecomeActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
        }
        else if self is DQMessageTableViewController
        {
            vistorView.setupVistorView("visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")

        }
        else  if self is  DQDiscoverTabBarController
        {
            vistorView.setupVistorView("visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
        }
        else  if self  is  DQMeTableViewController
        {
            vistorView.setupVistorView("visitordiscover_image_profile", message: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
        }
    }
        func  didEnterBackgroud()
         {
            (view as? DQVistorView)?.pauseAnimation()
         }
        func  didBecomeActive()
         {
            (view as? DQVistorView)?.resumeAnimation()
         }
}
extension DQBaseTableViewController : DQVistorViewDelegate
{
    func  vistViewRegistClick()
    {
        print(__FUNCTION__)
    }
    func  vistorViewLoginClick()
    {
        print(__FUNCTION__)
    }
}
