//
//  TweetEditViewController.swift
//  iOSAppSwift
//
//  Created by raymond on 9/21/16.
//  Copyright © 2016 raymond. All rights reserved.
//我的动态界面控制器, 用于加号按钮

import UIKit

class TweetEditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "动弹"
        self.view.backgroundColor = UIColor.clear
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(self.cancelTweet))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提交", style: .done, target: self, action: #selector(self.uploadTweet))
    }
    
    func cancelTweet() {
        self.dismissSelf()
    }
    
    func uploadTweet() {
        self.dismissSelf()
    }
    
    func dismissSelf() {
        let tabbarController = self.navigationController?.presentingViewController as! RootViewController
        tabbarController.selectedViewController = tabbarController.previouslySelectedVC
        self.dismiss(animated: true, completion: nil)
    }
}
