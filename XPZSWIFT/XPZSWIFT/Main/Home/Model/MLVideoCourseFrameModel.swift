//
//  MLVideoCourseFrameModel.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/30.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLVideoCourseFrameModel: NSObject {
    
    var cellSize = CGSize.zero
    var imageFrame = CGRect.zero
    var videoModel:MLVideoCourseModel? = nil
    var titleFrame:CGRect = CGRect.zero
    
    init(_ model:MLVideoCourseModel){
        super.init()
        videoModel = model
        let width:CGFloat = (kscreenWidth-40)/2
        let height:CGFloat = width*9/19
        self.cellSize = CGSize(width: width, height: height+30)
        self.imageFrame = CGRect(x: 0, y: 0, width: width, height: height)
        self.titleFrame = CGRect(x: 0, y: self.imageFrame.maxY, width: self.imageFrame.width, height: 30)
    }
}


