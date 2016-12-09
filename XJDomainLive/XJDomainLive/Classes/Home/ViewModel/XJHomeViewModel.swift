//
//  XJHomeViewModel.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/8.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit
import SwiftyJSON

class XJHomeViewModel {
    lazy var anchors : [HomeModel] = [HomeModel]()
}


extension XJHomeViewModel {
    func loadData(_ finishedCallBack : @escaping() -> ()) {
        XJNetworkTool.requestData(.get, urlString: kApiHomeList) { (result) in
            let json = JSON(result)
            let dataArray = json["lives"]
            
            for dict in dataArray {
                if let dict = dict.1.dictionaryObject {
                   let model = HomeModel(dict: dict)
                   self.anchors.append(model)
                    print(dict)
                }
            }
            print(self.anchors.count)
            finishedCallBack()
        }
    }
}
