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
        
        /*
         IJKMPMoviePlayerLoadStateDidChangeNotification(加载状态改变通知)
         IJKMPMoviePlayerPlaybackDidFinishNotification(播放结束通知)
         IJKMPMoviePlayerPlaybackStateDidChangeNotification(播放状态改变通知)
         */
        NotificationCenter.default.addObserver(self, selector: #selector(playbackStateDidChange(noti:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        NotificationCenter.default.removeObserver(self)
        XJAnimationTool.share.dismissAnimation({})
        
        
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
        self.ijkLivePlay.prepareToPlay()
    }
}

extension LiveViewController {
    @IBAction func backClick() {
       dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func playbackStateDidChange(noti : Notification) {
        switch (self.ijkLivePlay.playbackState) {
        case .stopped:
            print("停止")
        case .playing:
            print("正在播放")
            XJAnimationTool.share.dismissAnimation({})
        case .paused:
            print("暂停")
        case .interrupted:
            print("打断")
        case .seekingForward:
            print("快进")
        case .seekingBackward:
            print("快退")
        }
    }
}
