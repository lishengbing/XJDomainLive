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
            
            // 头像&&封面
            if let url = URL(string: anchorModel.userInfo?.portrait ?? "") {
                avator.kf.setImage(with: url)
                imageV.kf.setImage(with: url)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
