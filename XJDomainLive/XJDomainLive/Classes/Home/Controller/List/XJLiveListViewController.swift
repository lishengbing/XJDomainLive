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
    }
}


extension XJLiveListViewController {
    fileprivate func loadHomeData() {
        homeVM.loadData { 
            self.tableView.reloadData()
        }
    }
}


extension XJLiveListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVM.anchors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellID, for: indexPath) as! XJListTableViewCell
        //cell.backgroundColor = UIColor(red: (CGFloat(arc4random_uniform(255)) / 255.0), green: (CGFloat(arc4random_uniform(255)) / 255.0), blue: (CGFloat(arc4random_uniform(255)) / 255.0), alpha: 1)
        cell.anchorModel = homeVM.anchors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1)
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            //cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
            let anim = CATransition()
            anim.type = "rippleEffect"
            anim.duration = 1
            cell.layer.add(anim, forKey: "11")
        }, completion: { (_) in })
    }
}

