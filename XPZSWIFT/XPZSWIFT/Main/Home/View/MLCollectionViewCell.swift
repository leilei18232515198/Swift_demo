//
//  MLCollectionViewCell.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/28.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLCollectionViewCell: UICollectionViewCell {
    
    var frameModel : MLVideoCourseFrameModel?{
        didSet{
          guard let videoFrameModel = frameModel else{return}
          self.iconImageView?.frame = videoFrameModel.imageFrame
          self.iconImageView?.kf.setImage(with: URL(string: imageUrlString+videoFrameModel.videoModel!.mobileLogo), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            
          self.titleLabel?.frame = videoFrameModel.titleFrame
            self.titleLabel?.text = videoFrameModel.videoModel?.name
        }
    }
    var iconImageView : UIImageView?
    var titleLabel : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellView(){
        let iconImageView:UIImageView = UIImageView.init(frame: CGRect.zero)
        self.contentView.addSubview(iconImageView)
        self.iconImageView = iconImageView
        
        let titleLabel:UILabel = UILabel.init(frame: CGRect.zero)
        titleLabel.font = UIFont.systemFont(ofSize: 13.0)
        titleLabel.textColor = UIColor.init(white: 0.5, alpha: 1)
        self.contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel;
    }
}
