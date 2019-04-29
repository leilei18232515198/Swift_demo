//
//  MLCycleModel.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/29.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLCycleModel: NSObject {
   
    @objc var title:String = ""
    @objc var imagesUrl:String = ""

    init(dict: [String : Any]) {
        
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }

}
