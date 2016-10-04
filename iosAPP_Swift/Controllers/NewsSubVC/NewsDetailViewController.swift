//
//  NewsDetailViewController.swift
//  iosAPP_Swift
//
//  Created by raymond on 9/28/16.
//  Copyright © 2016 raymond. All rights reserved.
//  点击 综合 - 资讯 - cell 显示的新闻详细界面

//这个页面准备先用webView来做, 获取url后直接展示.

import UIKit
import Alamofire
import SnapKit

class NewsDetailViewController: UIViewController {
    
    var newsID: String?
    private var webContentView: UIWebView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateWebContentView(notif:)), name: NOTIFICATION_NEWS_DETAIL, object: nil)
        self.view.backgroundColor = UIColor.white
        self.webContentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webContentView)
        self.webContentView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        let parameter: Parameters = ["id" : newsID!]
        let parser = TheXMLParser(url: NEWS_DETAIL, parameters: parameter, requestType: RequstType.NewsDetail)
        print(parser)
    }
    
    func updateWebContentView(notif: Notification) {
        let newsArray = notif.userInfo?[NOTIFICATION_USERINFO_NEWS] as! [NewsObject]
        print(newsArray.last?.url)
        let strURL = newsArray.last?.url
        let url = URL(string: strURL!)
        let requestURL = URLRequest(url: url!)
        webContentView.loadRequest(requestURL)
    }
    
    


}
