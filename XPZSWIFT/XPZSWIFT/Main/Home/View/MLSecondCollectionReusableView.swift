//
//  MLSecondCollectionReusableView.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/30.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLSecondCollectionReusableView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHeadCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeadCellView(){
        let line:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: kscreenWidth, height: 10))
        line.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        addSubview(line)
        
//        视频课推荐按钮
        let videoButton:UIButton = UIButton.init(type:UIButton.ButtonType.custom)
        videoButton.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
        videoButton.setTitleColor(UIColor.init(white: 0.5, alpha: 1), for: UIControl.State.normal)
        videoButton.frame = self.bounds
        self.addSubview(videoButton)

        videoButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(line.snp.bottom)
            make.bottom.equalToSuperview()
        }
        videoButton.set(image: UIImage.init(named: "myhome_视频课推荐"), title: "视频课推荐", titlePosition: .right, additionalSpacing: 5, state: UIControl.State.normal)
        
//        选更多课
        let arrowButton:UIButton = UIButton.init(type:UIButton.ButtonType.custom)
        arrowButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        arrowButton.setTitleColor(UIColor.init(white: 0.5, alpha: 1), for: UIControl.State.normal)
        arrowButton.frame = self.bounds
        self.addSubview(arrowButton)
        arrowButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(videoButton.snp.centerY)
        }
        arrowButton.set(image: UIImage.init(named: "see_arrow"), title: "选更多课", titlePosition: .left, additionalSpacing: 5, state: UIControl.State.normal)

    }
}
