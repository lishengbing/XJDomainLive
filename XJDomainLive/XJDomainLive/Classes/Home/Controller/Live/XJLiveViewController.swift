//
//  XJLiveViewController.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/9.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit

class XJLiveViewController: UIViewController {
    
    var anchorModel : XJHomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension XJLiveViewController {
    fileprivate func setupUI() {
        //view.backgroundColor = kColorRandom
    }
}

extension XJLiveViewController {
    @IBAction func backClick() {
        dismiss(animated: true, completion: nil)
    }
}

