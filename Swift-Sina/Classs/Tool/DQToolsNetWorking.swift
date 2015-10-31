//
//  DQToolsNetWorking.swift
//  Swift-Sina
//
//  Created by 熊德庆 on 15/10/29.
//  Copyright © 2015年 熊德庆. All rights reserved.
import AFNetworking
class DQToolsNetWorking: AFHTTPSessionManager
{
    static let  defaultInstance :DQToolsNetWorking =
    {
        let urlStr = "https://api.weibo.com/"
        let tool = DQToolsNetWorking(baseURL: NSURL(string: urlStr))
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    let client_id = "3769988269"
    /// 申请应用时分配的AppSecret
    private let client_secret = "8c30d1e7d3754eca9076689b91531c6a"
    /// 请求的类型，填写authorization_code
    private let grant_type = "authorization_code"
    
    /// 回调地址
    let redirect_uri = "http://www.baidu.com/"
    // OAtuhURL地址
    func OauthURL() -> NSURL
    {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_id)&redirect_uri=\(redirect_uri)"
        return NSURL(string: urlString)!
    }
        
        // MARK: - 加载AccessToken  闭包回调
        func loadAccessToken(code: String, finshed: (result: [String: AnyObject]?, error: NSError?) -> ()) {
            // url
            let urlString = "oauth2/access_token"
            
            // NSObject
            // AnyObject, 任何 class
            // 参数
            let parameters = [
                "client_id": client_id,
                "client_secret": client_secret,
                "grant_type": grant_type,
                "code": code,
                "redirect_uri": redirect_uri
            ]

            // 测试返回结果类型  result: 请求结果
            POST(urlString, parameters: parameters, success:
                { (_, result) -> Void in
                
                finshed(result: result as? [String: AnyObject], error: nil)
                }) { (_, error: NSError) -> Void in
                    finshed(result: nil, error: error)
            }
        
        }
    }
