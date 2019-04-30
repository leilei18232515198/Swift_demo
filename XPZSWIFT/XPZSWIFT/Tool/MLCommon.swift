//
//  MLCommon.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/26.
//  Copyright © 2019 杨磊. All rights reserved.
//

import Foundation
import SnapKit
import Alamofire
import Kingfisher
import UIKit

enum MLMethodType {
    case get,post
}

enum MLButtonType:Int {
    case video = 0
    case found
    case information
    case piano
    case mall
}

let kscreenWidth = UIScreen.main.bounds.size.width
let kscreenHeight = UIScreen.main.bounds.size.height
let kTabbar_height:CGFloat = 49
let kStatusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.size.height
let kHomeSafeHeight:CGFloat = kStatusBarHeight>20 ? 34:0
let kNavBarHeight:CGFloat = 44.0


let httpUrl = "http://www.xiaopuzi.net/app/"
let imageUrlString = "http://cos.xiaopuzi.net"

