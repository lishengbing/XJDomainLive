//
//  XJLiveListViewController.swift
//  XJDomainLive
//
//  Created by 李胜兵 on 2016/12/8.
//  Copyright © 2016年 付公司. All rights reserved.
//

import UIKit
private let kCellID = "kCellID"

class XJLiveListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate lazy var homeVM : XJHomeViewModel = XJHomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadHomeData()
    }
}


extension XJLiveListViewController {
    fileprivate func setupUI() {
        navigationItem.title = "直播列表"
        tableView.register(UINib(nibName: "XJListTableViewCell", bundle: nil), forCellReuseIdentifier: kCellID)
        XJAnimationTool.share.showAnimation(view: self.view)
    }
}


extension XJLiveListViewController {
    fileprivate func loadHomeData() {
        homeVM.loadData {
            XJAnimationTool.share.dismissAnimation({ 
               self.tableView.reloadData()
            })
        }
    }
}

extension XJLiveListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVM.anchors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellID, for: indexPath) as! XJListTableViewCell
        cell.anchorModel = homeVM.anchors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85 + UIScreen.main.bounds.width
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.3, 0.3, 1)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }, completion: { (_) in
            let anim = CATransition()
            anim.type = "rippleEffect"
            anim.duration = 1
            cell.layer.add(anim, forKey: "11")
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("bbbb")
        let vc = XJLiveViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
}

