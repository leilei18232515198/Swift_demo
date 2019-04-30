//
//  MLBtnCollectionView.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/30.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

let  btnCellID = "btnCellID"
class MLBtnCollectionView: UICollectionView {

    var titleArray:[String]?
    var imageArray:[String]?

    class func creatButtonCollectionView(frame:CGRect, titleArray:[String],imageArray:[String]) -> MLBtnCollectionView{
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.itemSize = CGSize(width: kscreenWidth/5, height: 60)
        let collectionView = MLBtnCollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.titleArray = titleArray
        collectionView.imageArray = imageArray
        return collectionView
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        register(MLBtnCollectionViewCell.self, forCellWithReuseIdentifier: btnCellID)
        self.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MLBtnCollectionView : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.imageArray?.count as! Int
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MLBtnCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: btnCellID, for: indexPath) as!MLBtnCollectionViewCell
        cell.title = titleArray?[indexPath.row]
        cell.imageString = imageArray?[indexPath.row]
        return cell
    }


}
