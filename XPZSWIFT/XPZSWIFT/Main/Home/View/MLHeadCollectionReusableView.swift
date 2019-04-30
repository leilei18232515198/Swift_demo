//
//  MLHeadCollectionReusableView.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/29.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit
import SDCycleScrollView
class MLHeadCollectionReusableView: UICollectionReusableView {
    var array:[MLCycleModel]?{
        didSet{
           guard let newArray = array else { return }
            var tempArray:[String] = [String]()
            for model in newArray {
            tempArray.append(imageUrlString+model.imagesUrl)
            }
           self.cycleView.imageURLStringsGroup = tempArray
        }
    }
    var cycleView:SDCycleScrollView = SDCycleScrollView()
    var btnCollectionView:MLBtnCollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.cycleView.frame = CGRect(x: 0, y: 0, width: kscreenWidth, height: 0.5*kscreenWidth)
        self.cycleView.currentPageDotColor = .gray
        self.cycleView.pageDotColor = .white
        self.cycleView.autoScrollTimeInterval = 2.5
        self.cycleView.currentPageDotColor = .gray
        addSubview(cycleView)
        
        self.btnCollectionView = MLBtnCollectionView.creatButtonCollectionView(frame: CGRect(x: 0, y: self.cycleView.frame.maxY, width: kscreenWidth, height: 80) ,titleArray:["视频课","发现","资讯","本地学琴","商城"],imageArray:["myhome_视频课","myhome_直播课","首页","myhome_本地学琴","myhome_商城"])
        addSubview(self.btnCollectionView as! MLBtnCollectionView)
    }
   
    
}
