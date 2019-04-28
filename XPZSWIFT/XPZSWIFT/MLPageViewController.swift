//
//  MLPageViewController.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/26.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLPageViewController: UIViewController {

    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: kscreenWidth, height: kscreenHeight)
        scrollView.contentSize = CGSize(width: 2*kscreenWidth, height: kscreenHeight)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    view.addSubview(scrollView)
    let array:[String] = ["引导页1","引导页2"]
    for (index,value) in array.enumerated() {
        let imageView:UIImageView = UIImageView.init(frame: CGRect(x: CGFloat(index)*kscreenWidth, y: 0, width: kscreenWidth, height: kscreenHeight))
        imageView.image = UIImage.init(named: value)
        scrollView.addSubview(imageView)
        if index == array.count-1{
            let gesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(gesture)
        }
    }
    }
    
}

extension MLPageViewController{
    @objc func tapAction(_ gestureView:UIPanGestureRecognizer){
        let window:UIWindow? = UIApplication.shared.keyWindow
        window?.rootViewController = MLTabBarControllerViewController()
    }
}

