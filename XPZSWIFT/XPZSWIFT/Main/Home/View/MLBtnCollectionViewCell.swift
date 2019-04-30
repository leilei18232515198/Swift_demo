//
//  MLBtnCollectionViewCell.swift
//  XPZSWIFT
//
//  Created by 杨磊 on 2019/4/30.
//  Copyright © 2019 杨磊. All rights reserved.
//

import UIKit

class MLBtnCollectionViewCell: UICollectionViewCell {

    @objc var title:String?{
        didSet{
            guard let title = title else { return }
        }
    }
    @objc var imageString:String?{
        didSet{
            guard let imageString = imageString else { return }
            self.button?.set(image: UIImage.init(named: imageString), title: self.title as! String, titlePosition: .bottom, additionalSpacing: 5, state: UIControl.State.normal)
        }
    }
    
    var button:UIButton?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configureCellView() {
        let button:UIButton = UIButton.init(type:UIButton.ButtonType.custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        button.setTitleColor(UIColor.init(white: 0.5, alpha: 1), for: UIControl.State.normal)
        button.frame = self.bounds
        self.contentView.addSubview(button)
        self.button = button
    }
}

extension UIButton {
    
    @objc func set(image anImage: UIImage?, title: String,
                   titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
       
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    
    private func positionLabelRespectToImage(title: String, position: UIView.ContentMode,spacing: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
