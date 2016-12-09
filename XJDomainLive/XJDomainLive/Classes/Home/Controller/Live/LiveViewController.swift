//
//  LiveViewController.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/9.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit
import IJKMediaFramework

class LiveViewController: UIViewController {

    
    @IBOutlet weak var btn: UIButton!
    var anchorModel : HomeModel!
    var ijkLivePlay : IJKFFMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        XJAnimationTool.share.showAnimation(view: self.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        XJAnimationTool.share.dismissAnimation {
           self.ijkLivePlay.prepareToPlay()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        /* 释放 */
        if	ijkLivePlay != nil {
            ijkLivePlay.pause()
            ijkLivePlay.stop()
            ijkLivePlay.shutdown()
        }
    }
}

extension LiveViewController {
    fileprivate func setupUI() {
        self.view.backgroundColor = UIColor.white
        let requestUrl = URL(string: self.anchorModel.stream_addr ?? "")
        self.ijkLivePlay = IJKFFMoviePlayerController(contentURL: requestUrl, with: nil)
        self.ijkLivePlay.view.frame = UIScreen.main.bounds
        self.view.addSubview(self.ijkLivePlay.view)
        self.view.insertSubview(self.btn, aboveSubview: self.ijkLivePlay.view)
        
    }
}

extension LiveViewController {
    @IBAction func backClick() {
       dismiss(animated: true, completion: nil)
    }
}
