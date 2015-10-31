//
//  DQVistorView.swift
//  Swift - sina
//
//  Created by 熊德庆 on 15/10/26.
//  Copyright © 2015年 熊德庆. All rights reserved.
//

import UIKit
protocol  DQVistorViewDelegate:NSObjectProtocol
{
    func  vistorViewRegistClick()
    func  vistorViewLoginClick()
}
class DQVistorView: UIView
{
    
    weak  var  vistorViewDelegate:DQVistorViewDelegate?
    func  registClick()
    {
        vistorViewDelegate?.vistorViewRegistClick()
    }
    func  loginClick()
    {
        vistorViewDelegate?.vistorViewLoginClick()
    }
    func startRotationAnimation()
    {
        let  animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * M_PI
        animation.repeatCount = MAXFLOAT
        animation.duration = 20
        //完成不移除动画
        animation.removedOnCompletion = false
        //开始动画
        iconView.layer.addAnimation(animation, forKey: "homeRotation")
    }
    //暂停旋转
    func  pauseAnimation()
    {
        //记录暂停时间
        let pauseTime = iconView.layer.convertTime(CACurrentMediaTime(), fromLayer:nil)
        //设置动画时间
        iconView.layer.speed = 0
        //设置偏移时间
        iconView.layer.timeOffset = pauseTime
    }
    func  resumeAnimation()
    {
        let pauseTime = iconView.layer.timeOffset
        iconView.layer.speed = 1
        iconView.layer.timeOffset = 0
        iconView.layer.beginTime = 0
        
        let  timeSincPause = iconView.layer.convertTime(CACurrentMediaTime(), fromLayer: nil) - pauseTime
        iconView.layer.beginTime = timeSincPause
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    func  setupVistorView(imageName:String,message:String)
    {
        
        
        //隐藏房子
        homeView.hidden  = true
        iconView.image = UIImage(named: imageName)
        messageLable.text = message
        self.sendSubviewToBack(coverView)
    }
    //遮盖
     private lazy  var  coverView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    //覆盖父类的构造函数
   override init(frame: CGRect)
    {    //调用父类的构造函数
        super.init(frame: frame)
        prepreUI()
    }
   func  prepreUI()
   {
    backgroundColor = UIColor(white: 237.0 / 255, alpha: 1)
    
    addSubview(iconView)
    addSubview(coverView)
    addSubview(homeView)
    addSubview(messageLable)
    addSubview(registerButton)
    addSubview(loginButton)
    //禁用iconView Autoresizing
    iconView.translatesAutoresizingMaskIntoConstraints = false
    //禁用homeView Autoresizing
    homeView.translatesAutoresizingMaskIntoConstraints = false
    //禁用 coverView Autoresizing
    coverView.translatesAutoresizingMaskIntoConstraints = false
    //禁用messageLable Autoresizing
    messageLable.translatesAutoresizingMaskIntoConstraints = false
    //禁用loginButton Autoresizing
    registerButton.translatesAutoresizingMaskIntoConstraints = false
    //禁用loginButton Autoresizing
    loginButton.translatesAutoresizingMaskIntoConstraints = false
    
    //转轮x
    self.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
    //x
    self.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -50))
    
    // 小房子 x
    self.addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
    //y
    self.addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
    
    self.addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
    
    self.addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
    self.addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
    self.addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -70))
    
    // 消息 x
    self.addConstraint(NSLayoutConstraint(item: messageLable, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
    //顶部
    self.addConstraint(NSLayoutConstraint(item: messageLable, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
    //宽度
    self.addConstraint(NSLayoutConstraint(item: messageLable, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 240))
    
    //注册按钮  左边
    self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
    
    //顶部
    self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
    //宽度
    self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
    //高度
    self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute,  multiplier: 1, constant: 35))
    
    //登录按钮 右边
    self.addConstraint(NSLayoutConstraint(item:loginButton , attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
    //顶部
    self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLable, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
    //宽度
    self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
    //高度
    self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
    }
    private lazy  var  iconView:UIImageView = {
        //创建imageViw
        let  imageView = UIImageView()
        //创建image
        let imgae = UIImage(named:"visitordiscover_feed_image_smallicon")
        //为imageView.imagefuzhi
        imageView.image = imgae
        //根据图片大小渲染
        imageView.sizeToFit()
        //返回图片
        return  imageView
        }()
    
    private  lazy  var  homeView: UIImageView =
    {
        let  imageView = UIImageView()
        let  image = UIImage(named: "visitordiscover_feed_image_house")
        imageView.image = image
        imageView.sizeToFit()
        return imageView
        }()
    //MARK: - 消息懒加载
    lazy  var  messageLable:UILabel =
    {
        let  lable = UILabel()
        lable.text = "关注一些人,看看有什么惊喜,关注一些人,看看有什么惊喜,"
        lable.textColor = UIColor.lightGrayColor()
        lable.numberOfLines = 0
        lable.sizeToFit()
        return lable
        }()
    //注册按钮
    lazy  var  registerButton:UIButton = {
        let  button = UIButton()
        //设置标题 标题颜色
        button.setTitle("注册", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        //设置背景
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState:UIControlState.Normal)
        return  button
        }()
    //登陆按钮
    lazy  var  loginButton:UIButton =
    {
        let button = UIButton()
        button.setTitle("登陆", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState:UIControlState.Normal)
        button.sizeToFit()
        return  button
        }()
    }
