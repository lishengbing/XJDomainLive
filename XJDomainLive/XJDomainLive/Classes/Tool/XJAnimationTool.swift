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
    
    lazy var imageViewArrays : [UIImageView] = [UIImageView]()
    static var num : Int = 0
    
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
    func animationForHeart(view : UIView) {
        var imageV = UIImageView()
        imageV.frame = CGRect(x: kScreenW - CGFloat(80), y: kScreenH - CGFloat(40), width: 25, height: 25)
        imageV.backgroundColor = UIColor.clear
        imageV.clipsToBounds = true
        view.addSubview(imageV)
        
        let starX : CGFloat = CGFloat(round(Double(arc4random() % 300)))
        let scale  = round(Double(arc4random() % 2 + 1))
        let speed  = 1 / round(Double(arc4random() % 900) ) + 0.6
        let imageName = Int(round(Double(arc4random() % 10)))
        print(imageName)
        
        let index = XJAnimationTool.num
        let indexStr = "\(index)"
        UIView.beginAnimations(indexStr, context: &imageV)
        UIView.setAnimationDuration(7 * speed)
        let name = String(format: "XJDomain.bundle/heart%d.png", imageName)
        imageV.image = UIImage(named: name)
        let x = kScreenW - starX
        imageV.frame = CGRect(x: x, y: 100, width: CGFloat(25 * scale), height: CGFloat(25 * scale))
        UIView.setAnimationDidStop(#selector(animationCoplete(animationID:finished:context:)))
        UIView.setAnimationDelegate(self)
        UIView.setAnimationCurve(.easeIn)
        UIView.commitAnimations()
        
        // 计数器
        XJAnimationTool.num += 1
        imageViewArrays.append(imageV)
    }
    
   @objc fileprivate func animationCoplete(animationID : String, finished : NSNumber, context : UnsafeMutableRawPointer?) {
    
    let index = Int(animationID) ?? 0
    let imageV = imageViewArrays[index]
    imageV.removeFromSuperview()
    
//       let animationImageV = context.assumingMemoryBound(to: UIImageView.self)
//       let imageV = animationImageV.pointee
//       imageV.image = UIImage(named: String(format: "XJDomain.bundle/heart%d.png", 8))
//       imageV.removeFromSuperview()
    print("animationID",animationID)
    print(imageViewArrays.count)
    }
    
    
}


