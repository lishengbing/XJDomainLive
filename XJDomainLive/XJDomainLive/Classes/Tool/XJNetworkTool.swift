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
    class func requestData(_ type : MethodType, urlString : String, parameters : [String : Any]? = nil, finishedCallBack : @escaping(_ result : Any, _ isSuccess : Bool) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? "")
                finishedCallBack(response, false)
                return
            }
            finishedCallBack(result, true)
        }
    }
}













