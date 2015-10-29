

//
//  DQTabBar.swift
//  Swift - sina
//
//  Created by 熊德庆 on 15/10/27.
//  Copyright © 2015年 熊德庆. All rights reserved.
//

import UIKit

//class DQTabBar: UITabBar {
//
//    let  count:CGFloat = 5
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        let widh = bounds.width / count
//        
//        let  frame = CGRect(x: 0, y: 0, width: widh, height: bounds.height)
//        var  index = 0
//        for view in subviews
//        {
//           if view is UIControl  &&  !(view is UIButton)
//           {
//            print("view:\(view)")
//            view.frame = CGRectOffset(frame, widh * CGFloat(index), 0)
//            index += index == 1 ? 2 : 1
//            }
//            
//        }
//     //composeButton.frame = CGRectOffset(frame, widh*2.0, 0)
//    }
//    
//}