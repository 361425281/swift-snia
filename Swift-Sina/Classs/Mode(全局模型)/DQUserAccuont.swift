//
//  DQUserAccuont.swift
//  Swift-Sina
//
//  Created by 熊德庆 on 15/10/31.
//  Copyright © 2015年 熊德庆. All rights reserved.
//

import UIKit
class DQUserAccuont: NSObject,NSCoding
{
         // 当前授权用户的UID
    var  UID:String?
    var  expires_date: NSDate?
    // KVC 字典转模型
    init(dict:[String: AnyObject])
    {
        super.init()
        // 将字典里面的每一个key的值赋值给对应的模型属性
        setValuesForKeysWithDictionary(dict)
    }
    var  access_token:String?
    var expires_in:NSTimeInterval = 0
    { didSet{
        expires_date = NSDate(timeIntervalSinceNow: expires_in)
        print("expires_date:\(expires_date)")
        }
    }
    //当字典里面的key在模型里面没有对应的属性
    override func setValue(value: AnyObject?, forUndefinedKey key: String){}
    override var  description:String
    {
      return "access_token:\(access_token), expires_in:\(expires_in), uid:\(UID): expires_date:\(expires_date)"
    }
    //定义归档路经
    static  let  accountPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.UserDomainMask, true).last! + "/Account.plist"
    //加载帐号信息
    class func loadAccount() -> DQUserAccuont?
    {
        let account = NSKeyedUnarchiver.unarchiveObjectWithFile(accountPath) as? DQUserAccuont
        return  account
    }
   //保存帐号信息
    func  saveAccount()
    {
        NSKeyedArchiver.archiveRootObject(self, toFile: DQUserAccuont.accountPath)
    }
    //归档
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeDouble(expires_in, forKey: "expires_in")
        aCoder.encodeObject(UID, forKey: "UID")
        aCoder.encodeObject(expires_date, forKey: "expires_date")
    }
    //解档
    required  init?(coder aDecoder: NSCoder)
    {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeDoubleForKey("expires_in")
        UID = aDecoder.decodeObjectForKey("UID") as? String
        expires_date = aDecoder.decodeObjectForKey("expires_date") as? NSDate
    }
}
