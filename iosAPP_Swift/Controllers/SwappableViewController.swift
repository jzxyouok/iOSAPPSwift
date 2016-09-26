//
//  SwappableViewController.swift
//  iOSAppSwift
//
//  Created by raymond on 9/21/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import UIKit

class SwappableViewController: UIViewController {
    var titles: [String]
    
    convenience init(title: String, subTitles: [String], subVCs: [UIViewController]) {
        self.init(title: title, subTitles: subTitles, subVCs: subVCs, underTabBar: false)
    }
    
    init(title: String?, subTitles: [String], subVCs: [UIViewController], underTabBar: Bool?) {
        titles = subTitles
        super.init(nibName: nil, bundle: nil)
        self.title = title
        for vc in subVCs {
            self.addChildViewController(vc)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        let rect = CGRect(x: 0, y: 64, width: Int(self.view.bounds.size.width), height: 100)
        let titleTab = TitleTabBar(frame: rect, titles: titles)
        self.view.addSubview(titleTab)
    }
    
    deinit {
    }
}
