//
//  MLHomeViewController.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/26.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLHomeViewController: UIViewController {
    let dispatchGroup = DispatchGroup()
    var collectionView:MLCollectionView? = nil
    var frameModel:MLFrameModel = MLFrameModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        requestBannerData()
        requestInfoData()
        dispatchGroup.notify(queue: .main) {
            self.collectionView?.frameModel = self.frameModel
            self.collectionView?.reloadData()
        }

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func configureCollectionView() {
        
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = UICollectionView.ScrollDirection.vertical
    collectionView = MLCollectionView.init(frame: CGRect(x: 0, y: 0, width: kscreenWidth, height: kscreenHeight-kNavBarHeight-kStatusBarHeight-kHomeSafeHeight-kTabbar_height), collectionViewLayout: layout)
    view.addSubview(collectionView as! MLCollectionView)
    }
    
}

extension MLHomeViewController{
    /// 请求轮播图数据
    func requestBannerData() {
        dispatchGroup.enter()
        MLNetRequestModel.requestData(methodType: .get, Url: MLHttPUrlString.bannerString(), finishCallBack: { (response) in
            guard let resultDic = response as? [String : NSObject] else { return }
            guard let success = resultDic["success"] as? Bool else { return }
            if success{
            guard let entity = resultDic["entity"] as? [String : NSObject] else { return }
            guard let indexCenterBanner = entity["indexCenterBanner"] as? [Any] else { return }

            for dict in indexCenterBanner{
                let model = MLCycleModel.init(dict: dict as! [String : Any])
            self.frameModel.indexCenterBanner.append(model)
            }
            }
            self.dispatchGroup.leave()
        })
    }
    
    /// 请求列表信息
    func requestInfoData() {
        dispatchGroup.enter()
        let dic = ["queryMiShop.localArea":"北京市"]
        MLNetRequestModel.requestData(methodType: .post, Url: MLHttPUrlString.appIndexString(),param: dic, finishCallBack: { (response) in
            guard let resultDic = response as? [String : NSObject] else { return }
            guard let success = resultDic["success"] as? Bool else { return }
            if success{
                guard let entity = resultDic["entity"] as? [String : NSObject] else { return }
                guard let videoCourseList = entity["videoCourseList"] as? [Any] else { return }
                
                for dict in videoCourseList{
                let model = MLVideoCourseModel.init(dict: dict as! [String : Any])
                    let frameModel:MLVideoCourseFrameModel = MLVideoCourseFrameModel.init(model)
            self.frameModel.videoCourseList.append(frameModel)
                }
                }
                self.dispatchGroup.leave()
            
            })
    }
}
