//
//  RootViewController.swift
//  iOSAppSwift
//
//  Created by raymond on 9/19/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import UIKit
//import Alamofire

class RootViewController: UITabBarController,XMLParserDelegate {
    
    //MARK: - Properties
    
    private var addBtn: UITabBarItem?
    private var middleVC: UIViewController?
    
    public var previouslySelectedVC: UIViewController?

    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //资讯, 博客, 问答, 活动
        let newsSubVCNews = SubNewsTableViewController()
        let newsSubVCBlogs = SubBlogTableViewController()
        let newsSubVCQuestions = SubQuestionsTableViewController()
        let newsSubVCActivities = SubActivitiesTableViewController()
        
        //最新动弹, 热门动弹, 我的动弹
        let newestTweet = TweetTableViewController()
        let hotTweet = TweetTableViewController()
        let myTweet = TweetTableViewController()
        
        let subTitlesOnNews = ["资讯", "博客", "问答", "活动"]
        let subVCsOnNews = [newsSubVCNews, newsSubVCBlogs, newsSubVCQuestions, newsSubVCActivities]
        
        let subTitlesOnTweets = ["最新动弹", "热门动弹", "我的动弹"]
        let subVCsOnTweets = [newestTweet, hotTweet, myTweet]
        
        let newsSVC = SwappableViewController(title: "综合", subTitles: subTitlesOnNews, subVCs: subVCsOnNews, underTabBar: true)
        let tweetsSVC = SwappableViewController(title: "动弹", subTitles: subTitlesOnTweets, subVCs: subVCsOnTweets, underTabBar: true)
        middleVC = UIViewController()
        let discoverVC = DiscoverViewController()
        let homepageVC = HomePageViewController()

        let newsNavVC = self.addNavToViewController(viewController: newsSVC)
        let tweetsNavVC = self.addNavToViewController(viewController: tweetsSVC)
        let discoverNavVC = UINavigationController(rootViewController: discoverVC)
        let homepageNavVC = UINavigationController(rootViewController: homepageVC)
        
        self.viewControllers = [newsNavVC, tweetsNavVC, middleVC!, discoverNavVC, homepageNavVC]    // tabbar的子控制器

        let titleArray = ["综合", "动弹", "", "发现", "我的"]
        let images = ["tabbar-news", "tabbar-tweet", "ic_nav_add", "tabbar-discover", "tabbar-me"]
        
        for (index,item) in self.tabBar.items!.enumerated() {//TabBar标题和图片赋值
            item.title = titleArray[index]
            
            let imageName = images[index]
            let imageNameSelected = imageName.appending("-selected")
            
            item.image = UIImage(named: images[index])?.withRenderingMode(.alwaysOriginal)
            item.selectedImage = UIImage(named: imageNameSelected)?.withRenderingMode(.alwaysOriginal)
        }
        
        self.addBtn = self.tabBar.items?[2]
        self.adjustTabBarItemImage(item: self.addBtn!)   //调整一下"+"按钮的图片位置
        
        self.selectedViewController = self.viewControllers?[0]
        self.previouslySelectedVC = self.selectedViewController
    }
    
    /// 调整TabBarItem的图片位置居中
    ///
    /// - parameter item: 须调整图片位置的item
    func adjustTabBarItemImage(item: UITabBarItem) {
        item.imageInsets = UIEdgeInsetsMake(5.0, 0.0, -5.0, 0.0)
    }
    
    /// 向viewController添加UINavigationController类型的父控制器, 并将它RightBarButtonItem设置为搜索按钮.
    ///
    /// - parameter viewController: 待设置的控制器
    ///
    /// - returns: 添加到viewController的导航控制器.
    func addNavToViewController(viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.pushSearchViewController))
        return navigationController
    }
    
    /// 展示搜索界面
    func pushSearchViewController() {
        print("需要实现搜索界面")
    }
    
    /// 展示推特界面(点击加号)
    func presentTweetEditNavVC() {
        let tweetEditVC = TweetEditViewController()
        let tweetEditNavVC = UINavigationController(rootViewController: tweetEditVC)
        self.previouslySelectedVC = self.selectedViewController
        self.selectedViewController?.present(tweetEditNavVC, animated: true, completion: nil)
    }
    
    //MARK: - TabBar Delegate
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == self.addBtn {
            self.presentTweetEditNavVC()
        }
    }
    
    //MARK: - XMLParser
    
    func parserDidStartDocument(_ parser: XMLParser) {
        print("开始解析")
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        print("结束解析")
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }
}
