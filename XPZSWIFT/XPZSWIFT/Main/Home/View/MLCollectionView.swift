//
//  MLCollectionView.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/28.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit
let CellID = "CellID"
let headCellID = "headCellID"
let secondCellID = "secondCellID"


class MLCollectionView: UICollectionView {
    
   @objc var frameModel:MLFrameModel = MLFrameModel()
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        register(MLCollectionViewCell.self, forCellWithReuseIdentifier: CellID)
        register(MLHeadCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headCellID)
        register(MLSecondCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:secondCellID)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MLCollectionView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        if section != 0{
            count = self.frameModel.videoCourseList.count
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MLCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! MLCollectionViewCell
        cell.frameModel = self.frameModel.videoCourseList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headView:UICollectionReusableView!
        if indexPath.section == 0{
        let firstView:MLHeadCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headCellID, for: indexPath) as! MLHeadCollectionReusableView
        firstView.array = self.frameModel.indexCenterBanner
        headView = firstView
        }else{
        let secondView:MLSecondCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: secondCellID, for: indexPath) as! MLSecondCollectionReusableView
        headView = secondView
        }
        return headView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        var size = CGSize(width: 0, height: self.frameModel.secondHeight)
        if section == 0 {
            size = CGSize(width: kscreenWidth, height: self.frameModel.headHeight)
        }
        return size
    }
    
    // 每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let courseFrameModel:MLVideoCourseFrameModel = self.frameModel.videoCourseList[indexPath.section]
        return courseFrameModel.cellSize
    }

    // 最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
