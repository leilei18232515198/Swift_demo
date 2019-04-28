//
//  MLHttPUrlString.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/28.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLHttPUrlString: NSObject {

    class func bannerString() -> (String){
        return  httpUrl+"index/banner"
    }
    
    class func appIndexString() -> (String){
        return  httpUrl+"index/appIndex"
    }
    
}
