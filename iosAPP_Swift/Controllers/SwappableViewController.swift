//
//  SwappableViewController.swift
//  iOSAppSwift
//
//  Created by raymond on 9/21/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import UIKit
import SnapKit

class SwappableViewController: UIViewController, UIScrollViewDelegate, UITabBarDelegate {
    
    //MARK: - Properties
    
    var titles: [String]
    var subVCs: [UIViewController]
    
    //MARK: - Initializers
    
    convenience init(title: String, subTitles: [String], subVCs: [UIViewController]) {
        self.init(title: title, subTitles: subTitles, subVCs: subVCs, underTabBar: false)
    }
    
    init(title: String?, subTitles: [String], subVCs: [UIViewController], underTabBar: Bool?) {
        self.titles = subTitles
        self.subVCs = subVCs
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.tabBarController?.tabBar.isTranslucent = false
        self.navigationController?.view.addSubview(self.view)
        let rootViewWidth = self.view.bounds.size.width
        //--顶部标题栏--
        let titleBar = TitleTabBar(frame: CGRect(), titles: self.titles)
        titleBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleBar)
        titleBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(44.0)
        }
        //--内容视图容器--
        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(titleBar.snp.bottom)
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
        }
        scrollView.backgroundColor = UIColor.red        //演示
        let scrollViewContentWidth = rootViewWidth * CGFloat(self.subVCs.count)
        scrollView.contentSize = CGSize(width: scrollViewContentWidth, height: 0)
        //--4个子控制器视图放入容器--
        for (n,vc) in self.subVCs.enumerated() {
            vc.view.frame = CGRect(x: CGFloat(n) * rootViewWidth, y: 0, width: rootViewWidth, height: scrollView.bounds.size.height)
            scrollView.addSubview(vc.view)
        }
        
    }
}
















