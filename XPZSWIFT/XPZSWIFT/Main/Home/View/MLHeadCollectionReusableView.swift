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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.cycleView.frame = self.bounds
        self.cycleView.currentPageDotColor = .gray
        self.cycleView.pageDotColor = .white
        self.cycleView.autoScrollTimeInterval = 2.5
        self.cycleView.currentPageDotColor = .gray
        addSubview(cycleView)
    }
   
    
}
