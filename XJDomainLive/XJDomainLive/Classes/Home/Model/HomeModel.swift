//
//  HomeMode.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/8.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit

class HomeModel: NSObject {

    /// 直播视频流
    var shareAddr : String?
    /* 关注人 */
    var online_users : Int = 0
    /* 城市 */
    var city : String? 
    /* 主播 */
    var creator : [String : Any]? {
        didSet {
            guard let creator = creator else { return }
            userInfo = UserModel(Dict: creator)
        }
    }
    
    // 主播信息
    var userInfo : UserModel?
    
    
    // 自定义构造函数
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}


class UserModel : NSObject {
    /// 主播名
    var nick:String?
    
    /// 主播头像
    var portrait:String?
    
    init(Dict: [String : Any]) {
        super.init()
        setValuesForKeys(Dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
