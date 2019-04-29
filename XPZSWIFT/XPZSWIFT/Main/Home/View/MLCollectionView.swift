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

class MLCollectionView: UICollectionView {
    
   @objc var frameModel:MLFrameModel = MLFrameModel()
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        register(MLCollectionViewCell.self, forCellWithReuseIdentifier: CellID)
        register(MLHeadCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headCellID)
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MLCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! MLCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headView:MLHeadCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headCellID, for: indexPath) as! MLHeadCollectionReusableView
        headView.array = self.frameModel.indexCenterBanner
        return headView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height:100)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: kscreenWidth, height: self.frameModel.headHeight)
    }
}
