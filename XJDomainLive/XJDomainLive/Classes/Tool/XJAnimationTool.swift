//
//  XJAnimationTool.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/9.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit
import Foundation

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
    
    var timer : Timer?
    fileprivate var view : UIView!
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
        self.view = view
    }
    
    func dismissAnimation(_ finished : @escaping () -> ()) {
        // 1.停止动画
        imageView.stopAnimating()
        
        // 2.隐藏animationImageView
        imageView.isHidden = true
        backBtn.isHidden = true
        
        // 回调
        finished()
    }
}

extension XJAnimationTool {
    @objc fileprivate func backClick() {
         self.myBlock!()
        dismissAnimation {}
    }
}

extension XJAnimationTool {
    func animationForHeart() {
        let imageV = UIImageView()
        imageV.frame = CGRect(x: kScreenW - CGFloat(84), y: kScreenH - CGFloat(58), width: 25, height: 25)
        imageV.backgroundColor = UIColor.clear
        imageV.clipsToBounds = true
        self.view.addSubview(imageV)
        
        // UInt32(0.9)
        let starX : CGFloat = CGFloat(round(Double(arc4random() % 300)))
        var scale  = round(Double(arc4random() % 2 + 1))
        let speed  = 1 / round(Double(arc4random() % 900) ) + 0.4
        let imageName = Int(round(Double(arc4random() % 10)))
        let name = String(format: "XJDomain.bundle/heart%d.png", imageName)
        imageV.image = UIImage(named: name)
        let x = (kScreenW - starX) * 1.5
        if scale >= 1.2 {
            scale = 1.2
        }
        
        UIView.animate(withDuration: 7 * speed, animations: {
            imageV.frame = CGRect(x: x, y: kScreenH - 400, width: CGFloat(25 * scale), height: CGFloat(25 * scale))
        }, completion: { (_) in
            imageV.removeFromSuperview()
        })
    }
}

extension XJAnimationTool {
    func addCycleTimer() {
        timer = Timer(timeInterval: 0.35, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode:RunLoopMode.commonModes)
    }
    
     func removeCycleTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc fileprivate func scrollToNext() {
        XJAnimationTool.share.animationForHeart()
        XJAnimationTool.share.animationForHeart()
        XJAnimationTool.share.animationForHeart()
    }
}


