//
//  XJListTableViewCell.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/8.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit
import Kingfisher

class XJListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var avator: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var labelNums: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    var anchorModel : HomeModel? {
        didSet {
            guard let anchorModel = anchorModel else {
                return
            }
            
            labelNums.text = "\(anchorModel.online_users)人在看"
            cityLabel.text = anchorModel.city
            name.text = anchorModel.userInfo?.nick
            
            
            // http://img2.inke.cn/MTQ4MTIzNjQ4ODM2MSM5MzYjanBn.jpg
            // MTQ3OTgxMTYwMDc0MyMxMjgjanBn.jpg
            // 头像&&封面
            var imageUrl = anchorModel.userInfo?.portrait
            // 处理图片地址
            if imageUrl?.hasPrefix("http://img2.inke.cn/") == false {
                imageUrl = "http://img2.inke.cn/" + (anchorModel.userInfo?.portrait)!
            }
            
            if let url = URL(string: imageUrl ?? "") {
                avator.kf.setImage(with: url, placeholder: UIImage(named: "avatar_default"))
                imageV.kf.setImage(with: url, placeholder: UIImage(named: "avatar_default"))
            }else {
                avator.image = UIImage(named: "avatar_default")
                imageV.image = UIImage(named: "avatar_default")
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
