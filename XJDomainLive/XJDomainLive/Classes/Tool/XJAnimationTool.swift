//
//  XJAnimationTool.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/9.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit

class XJAnimationTool {
    static var share : XJAnimationTool = XJAnimationTool()
    
    fileprivate lazy var imageView : UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.animationImages = [UIImage(named: "img_loading_1")!,UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return imageView
    }()
}

extension XJAnimationTool {
    func showAnimation(view : UIView) {
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        // 2.添加执行动画的animationImageView
        view.addSubview(imageView)
        imageView.center = view.center
        imageView.isHidden = false
        
        // 3.执行动画
        imageView.startAnimating()
    }
    
    func dismissAnimation() {
        // 1.停止动画
        imageView.stopAnimating()
        
        // 2.隐藏animationImageView
        imageView.isHidden = true
    }
}
