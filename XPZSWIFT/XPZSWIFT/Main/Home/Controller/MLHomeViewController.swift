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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        requestBannerData()
        requestInfoData()
        dispatchGroup.notify(queue: .main) {
            
        }

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func configureCollectionView() {
        
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
    collectionView = MLCollectionView.init(frame: CGRect(x: 0, y: 0, width: kscreenWidth, height: kscreenHeight-kNavBarHeight-kStatusBarHeight-kHomeSafeHeight-kTabbar_height), collectionViewLayout: layout)
    collectionView?.backgroundColor = .magenta
    view.addSubview(collectionView as! MLCollectionView)
        
    }
    
}

extension MLHomeViewController{
    /// 请求轮播图数据
    func requestBannerData() {
        dispatchGroup.enter()
        [MLNetRequestModel.requestData(methodType: .get, Url: MLHttPUrlString.bannerString(), finishCallBack: { (resonse) in
            
            self.dispatchGroup.leave()
        })]
    }
    
    /// 请求列表信息
    func requestInfoData() {
        dispatchGroup.enter()
        let dic = ["queryMiShop.localArea":"北京市"]
        [MLNetRequestModel.requestData(methodType: .post, Url: MLHttPUrlString.appIndexString(), finishCallBack: { (response) in

            self.dispatchGroup.leave()
        })]
    }

}
