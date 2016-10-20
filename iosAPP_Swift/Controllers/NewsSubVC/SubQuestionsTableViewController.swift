//
//  SubQuestionsTableViewController.swift
//  iOSAppSwift
//
//  Created by raymond on 9/21/16.
//  Copyright © 2016 raymond. All rights reserved.
//  综合 - 问答

import UIKit

class SubQuestionsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    init() {
        super.init(style: .grouped)
        //TODO: 初始化
    }
    required init?(coder aDecoder: NSCoder) {
        //FIXME: 待修改
        fatalError("")
    }
}
