//
//  XJTabBarController.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/8.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit

class XJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       addChildViewController(XJLiveListViewController(), imageName: "liveList", title: "直播列表")
        addChildViewController(XJPrepareLiveViewController(), imageName: "video", title: "直播")
    }
}

extension XJTabBarController {
    fileprivate func addChildViewController(_ childController: UIViewController, imageName : String, title : String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.title = title
        
        let nav = XJNavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
}
