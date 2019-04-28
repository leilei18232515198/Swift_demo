//
//  MLTabBarControllerViewController.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/26.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBar.tintColor = UIColor.init(red: 63/255.0, green: 131/255.0, blue: 230/255.0, alpha: 1)
//        首页
        let homeViewController = MLHomeViewController()
//        选课
        let courseViewController = MLCourseViewController()
//        直播
        let liveCourseViewController = MLLIveCourseViewController()
//        社区
        let communicationViewController = MLCommunicationViewController()
//        我的
        let mineViewController = MLMineViewController()
//        控制器数组集合
        let controllers:[UIViewController] = [homeViewController,courseViewController,liveCourseViewController,communicationViewController,mineViewController]
        let array:[String] = ["选中首页","选中选课","选中直播","选中社区","选中我的"]
        let titleArray:[String] = ["首页","选课","直播","社区","我的"]
        for (index,value) in array.enumerated() {
            let image:UIImage? = UIImage.init(named: value)
            let selectImage:UIImage? = UIImage.init(named: "未"+value)
            addController(controller: controllers[index], image: image, selectImage:selectImage,title: titleArray[index])
        }
        
        let tabBar = MLTabBar()
        self.setValue(tabBar, forKey: "tabBar")
    }
    
    
    func addController(controller:UIViewController,image:UIImage?,selectImage:UIImage?,title:String) -> Void{
        
        controller.tabBarItem.title = title
        controller.title = title
        controller.tabBarItem.image = image
        controller.tabBarItem.selectedImage = selectImage
    controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.init(red: 127/255.0, green: 127/255.0, blue: 127/255.0, alpha: 1)], for: .normal)
    controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.init(red: 63/255.0, green: 131/255.0, blue: 230/255.0, alpha: 1)], for: .selected)
        
        let nav:MLNavigationViewController = MLNavigationViewController(rootViewController: controller)
        addChild(nav)
        
    }
    
}
