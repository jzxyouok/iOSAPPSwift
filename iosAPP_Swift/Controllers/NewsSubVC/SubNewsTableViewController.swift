//
//  SubNewsTableViewController.swift
//  iOSAppSwift
//
//  Created by raymond on 9/21/16.
//  Copyright © 2016 raymond. All rights reserved.
// 综合 - 资讯

import UIKit
import MBProgressHUD

class SubNewsTableViewController: UITableViewController {
    var hudView: MBProgressHUD? //一朵菊花在这播种, 怎么开不起来...
    var newsList: [NewsObject] = [NewsObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "NewsListcell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "NewsListCell")
        NotificationCenter.default.addObserver(self, selector: #selector(self.retriveNetworkDataWith(notification:)), name: NOTIFICATION_NEWS_ARRIVE, object: nil)
        let parser = TheXMLParser(url: NEWS_LIST)
        print(parser)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }
    
    func retriveNetworkDataWith(notification notif: Notification) {
        if notif.name.rawValue == "END_RETRIVE_NEWS_LIST" {
            
            self.newsList = notif.userInfo?[NOTIFICATION_USERINFO_NEWS]! as! [NewsObject]

            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell") as! NewsTableViewCell
        if self.newsList.count > 0 {
            //设置显示文字
            let newsObj = self.newsList[indexPath.row]
            cell.titleLabel.text = newsObj.title
            cell.authorLabel.text = newsObj.author
            cell.detailLabel.text = newsObj.body
        }
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsID = self.newsList[indexPath.row].id!
        print(newsID)
        let detailVC = NewsDetailViewController()
        detailVC.newsID = newsID
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
