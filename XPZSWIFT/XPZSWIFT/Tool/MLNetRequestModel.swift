//
//  MLNetRequestModel.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/28.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit
import Alamofire
class MLNetRequestModel: NSObject {

    class func requestData(methodType:MLMethodType,Url:String,param:[String:Any]? = nil,finishCallBack: @escaping(_ result:AnyObject) -> ()){
        
        let requestType:HTTPMethod = methodType == .get ?  HTTPMethod.get:HTTPMethod.post
        Alamofire.request(Url, method: requestType, parameters: param).responseJSON{
            (response) in
            guard let result = response.result.value else {
                print(response.result.error)
                return
            }
            finishCallBack(result as AnyObject)
        }
    }
    
}
