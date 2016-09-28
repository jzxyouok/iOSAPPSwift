//
//  NewsDetailViewController.swift
//  iosAPP_Swift
//
//  Created by raymond on 9/28/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit

class NewsDetailViewController: UIViewController {
    var newsID: String?

    private var detailLabel = UILabel()
    private var detail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let label = UILabel()
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100.0)
            make.height.equalTo(40.0)
        }
        label.adjustsFontSizeToFitWidth = true
        label.text = "标题"
        
        self.view.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(label).offset(20.0)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        let parameter: Parameters = ["id" : newsID!]
        self.detailLabel.numberOfLines = 0
        Alamofire.request(NEWS_DETAIL, method: .get, parameters: parameter).response { (response) in
            self.detailLabel.text = String(data: response.data!, encoding: .utf8)
            if response.data?.count == 0 {
                self.detailLabel.text = "网络请求失败"
            }
        }
    }


}
