//
//  NewsTableViewCell.swift
//  iosAPP_Swift
//
//  Created by raymond on 9/28/16.
//  Copyright © 2016 raymond. All rights reserved.
//  综合 - 资讯 - 界面自定义cell

import UIKit

class NewsTableViewCell: UITableViewCell {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.backgroundColor = UIColor.white
        authorLabel.backgroundColor = UIColor.white
        detailLabel.backgroundColor = UIColor.white
    }
}
