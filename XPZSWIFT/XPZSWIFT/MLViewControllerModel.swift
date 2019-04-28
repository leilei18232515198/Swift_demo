//
//  MLViewControllerModel.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/26.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLViewControllerModel: NSObject {

    class func mainViewController() ->(UIViewController){
        let userDefault = UserDefaults.standard
        let version:String? = (userDefault.value(forKey: "version"))as?String
        //获取当前版本号
        let infoDictionary = Bundle.main.infoDictionary
        let currentVersion = infoDictionary?["CFBundleShortVersionString"] as!String
        var controller:(UIViewController)
        if version == nil||version != currentVersion  {
//           直接进入引导页
            controller = MLPageViewController()
            userDefault.setValue(currentVersion, forKey: "version")
        }else{
//           直接进入首页
            controller = MLTabBarControllerViewController()
        }
    
        return controller
    }
    
}
