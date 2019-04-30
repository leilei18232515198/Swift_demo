//
//  MLFrameModel.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/29.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLFrameModel: NSObject {

    @objc var indexCenterBanner:[MLCycleModel] = [MLCycleModel]()
    @objc var videoCourseList:[MLVideoCourseFrameModel] = [MLVideoCourseFrameModel]()
    var headHeight:CGFloat = kscreenWidth/2+80
    var secondHeight:CGFloat = 50
    
    
}
