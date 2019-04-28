//
//  MLNavigationViewController.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/26.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLNavigationViewController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.interactivePopGestureRecognizer?.delegate = self
        UINavigationBar.appearance().tintColor = UIColor.init(red: 127/255.0, green: 127/255.0, blue: 127/255.0, alpha: 1)
        configureNavigationView()
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool{
        if self.viewControllers.count <= 1{
            return false
        }
        return true
    }
    /// 配置导航栏信息
    func configureNavigationView() -> Void {
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationBar.barTintColor = UIColor.init(red: 63/255.0, green: 131/255.0, blue: 230/255.0, alpha: 1)
        navigationBar.isTranslucent = false
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
}
