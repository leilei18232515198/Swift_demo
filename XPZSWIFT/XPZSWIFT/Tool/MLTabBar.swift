//
//  MLTabBar.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/28.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLTabBar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        for tabBarButton in self.subviews {
            if NSStringFromClass(tabBarButton.classForCoder) == "UITabBarButton"{
                let ctr = tabBarButton as! UIControl
                ctr.addTarget(self, action: #selector(clickTabBarItem(selectItem:)), for: .touchUpInside)
            
            }
        }
    }
    
    @objc func clickTabBarItem(selectItem:UIControl){
        
        for itemImageView in selectItem.subviews{
            if NSStringFromClass(itemImageView.classForCoder) == "UITabBarSwappableImageView"{
                tabBarDidSelectImageAnimation(view: itemImageView)
            }
        }
    }
    
    func tabBarDidSelectImageAnimation(view:UIView) -> Void {
        let scaleAnimation = CAKeyframeAnimation()
        scaleAnimation.keyPath = "transform.scale"
        scaleAnimation.values = [1.0,1.3,1.5,1.25,0.8,1.25,1.0]
        scaleAnimation.duration = 0.5
        scaleAnimation.repeatCount = 1
        view.layer.add(scaleAnimation, forKey: "123")
    }
}
