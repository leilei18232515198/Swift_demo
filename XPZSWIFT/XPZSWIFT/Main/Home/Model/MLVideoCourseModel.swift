//
//  MLVideoCourseModel.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/30.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLVideoCourseModel: NSObject {
    @objc var mobileLogo:String = ""
    @objc var name:String = ""
    @objc var subjectName:String = ""
    @objc var currentprice:CGFloat = 0
    
    init(dict: [String : Any]) {
        
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        
    }

}
