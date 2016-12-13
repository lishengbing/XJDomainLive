//
//  LiveTopView.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/10.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit
import Kingfisher

class LiveTopView: UIView {
    @IBOutlet weak var avator: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    var anchors : HomeModel? {
        didSet {
            guard let anchors = anchors else {
                return
            }
            var imageUrl = anchors.userInfo?.portrait
            if imageUrl?.hasPrefix("http://img2.inke.cn/") == false {
                imageUrl = "http://img2.inke.cn/" + (anchors.userInfo?.portrait)!
            }
            
            if let url = URL(string: imageUrl ?? "") {
                avator.kf.setImage(with: url, placeholder: UIImage(named: "avatar_default"))
            }else {
                avator.image = UIImage(named: "avatar_default")
            }
        }
    }
}

extension LiveTopView {
    class func topView() -> LiveTopView {
        return Bundle.main.loadNibNamed("LiveTopView", owner: self, options: nil)?.first as! LiveTopView
    }
}
