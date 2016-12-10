//
//  XJAnimationTool.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/9.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit

typealias animationCloseBlock = () -> ()
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
    
    fileprivate lazy var backBtn : UIButton = UIButton()
    var myBlock : animationCloseBlock?
}

extension XJAnimationTool {
    func showAnimation(view : UIView) {
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        // 2.添加执行动画的animationImageView
        view.addSubview(imageView)
        imageView.center = view.center
        imageView.isHidden = false
        backBtn.isHidden = false
        
        // 添加返回按钮
        view.addSubview(backBtn)
        backBtn.frame = CGRect(x: 0, y: 25, width: 60, height: 40)
        backBtn.setTitle("返 回", for: .normal)
        backBtn.setTitleColor(UIColor.orange, for: .normal)
        backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        backBtn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        
        // 3.执行动画
        imageView.startAnimating()
    }
    
    func dismissAnimation(_ finished : @escaping () -> ()) {
        // 1.停止动画
        imageView.stopAnimating()
        
        // 2.隐藏animationImageView
        imageView.isHidden = true
        backBtn.isHidden = true
        
        finished()
    }
}

extension XJAnimationTool {
    @objc fileprivate func backClick() {
         self.myBlock!()
        dismissAnimation {}
    }
}
