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
    var scrollView: UIScrollView?
    var titleBar: UITabBar?
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
        titleBar = TitleTabBar(frame: CGRect(), titles: self.titles)
        titleBar!.delegate = self
        titleBar!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleBar!)
        titleBar!.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(44.0)
        }
        
        //--内容视图容器--
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView!.translatesAutoresizingMaskIntoConstraints = false
        scrollView?.isPagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.delegate = self
        self.view.addSubview(scrollView!)
        scrollView!.snp.makeConstraints { (make) in
            make.top.equalTo(titleBar!.snp.bottom)
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
        }
        
        let scrollViewContentWidth = rootViewWidth * CGFloat(self.subVCs.count)
        scrollView!.contentSize = CGSize(width: scrollViewContentWidth, height: 0)
        
        //--4个子控制器视图放入容器--
        for (n,vc) in self.subVCs.enumerated() {
            vc.view.frame = CGRect(x: CGFloat(n) * rootViewWidth, y: 0, width: rootViewWidth, height: scrollView!.bounds.size.height)
            scrollView!.addSubview(vc.view)
            self.addChildViewController(vc)
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        moveWithItemTag(tag: item.tag, scrollView: self.scrollView!)
        print(tabBar.items)
    }
    
    func moveWithItemTag(tag: Int, scrollView: UIScrollView) {
        let x = CGFloat(tag) * scrollView.bounds.size.width
        let point = CGPoint(x: x, y: 0)
        scrollView.setContentOffset(point, animated: false)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let point = targetContentOffset.pointee
        let tag = Int(point.x / scrollView.bounds.size.width)
        self.titleBar?.selectedItem = titleBar?.items![tag]
    }

}
