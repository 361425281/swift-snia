//
//  DQOauthViewController.swift
//  Swift-Sina
//
//  Created by 熊德庆 on 15/10/31.
//  Copyright © 2015年 熊德庆. All rights reserved.
//

import UIKit
import SVProgressHUD
class DQOauthViewController: UIViewController
{
    override func  loadView()
    {
        view = webView
        webView.delegate = self
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        //加载网页
        let request = NSURLRequest(URL: DQToolsNetWorking.defaultInstance.OauthURL())
        webView.loadRequest(request)
    }
    //关闭控制器
    func  close()
    {
        SVProgressHUD.dismiss()
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    //懒加载
    private  lazy  var webView = UIWebView()
}
extension DQOauthViewController: UIWebViewDelegate
{
    func  webViewDidStartLoad(webView: UIWebView)
    {
        SVProgressHUD.showWithStatus("正在玩命加载。。。", maskType: SVProgressHUDMaskType.Black)
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView)
    {
        SVProgressHUD.dismiss()
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let urlStr = request.URL!.absoluteString
        print("urlStr:\(urlStr)")
        if !urlStr.hasPrefix(DQToolsNetWorking.defaultInstance.redirect_uri)
        {
            return true
        }
        if let query = request.URL?.query
        {
            let codeStr = "code="
            if query.hasPrefix(codeStr)
            {
                let nsQuery = query  as NSString
                let code = nsQuery.substringFromIndex(codeStr.characters.count)
                print("code:\(code)")
                
            }
        }
        return false
    }
    func  loaaAccessToken(code:String)
    {
        DQToolsNetWorking.defaultInstance.loadAccessToken(code)
            {
                (result,error) -> () in
                if error != nil || result == nil
                {
                    SVProgressHUD.showWithStatus("网络不给力。。", maskType: SVProgressHUDMaskType.Black)
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(),
                        { () -> Void in
                            self.close()
                    })
                    return
                }
        }
    }
}