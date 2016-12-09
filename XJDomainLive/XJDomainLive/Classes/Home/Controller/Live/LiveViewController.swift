//
//  LiveViewController.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/9.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }
    
}

extension LiveViewController {
    fileprivate func setupUI() {
        view.backgroundColor = kColorRandom
    }
}

extension LiveViewController {
    @IBAction func backClick() {
       dismiss(animated: true, completion: nil)
    }
}
