//
//  XJNetworkTool.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/8.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class XJNetworkTool: NSObject {

}


extension XJNetworkTool {
    class func requestData(_ type : MethodType, urlString : String, parameters : [String : Any]? = nil, finishedCallBack : @escaping(_ result : Any) -> ()) {
        // 获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 发送网络请求 
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            // 获取结果
            guard let result = response.result.value else {
               print(response.result.error ?? "")
                return
            }
            // 返回结果
            finishedCallBack(result)
        }
    }
}













