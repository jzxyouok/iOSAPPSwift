//
//  TitleTabBar.swift
//  iOSAppSwift
//
//  Created by raymond on 9/23/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import UIKit

class TitleTabBar: UITabBar {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, titles: [String]?) {
        super.init(frame: frame)
        var itemArray = [UITabBarItem]()
        
        if let titleArray = titles {
            for (n, title) in titleArray.enumerated() {
                let tabbarItem = UITabBarItem(title: title, image: nil, tag: n)
                itemArray.append(tabbarItem)
            }
        }//if
        
        self.setItems(itemArray, animated: true)
        
        for item in self.items! {
            let font = UIFont.boldSystemFont(ofSize: 15)
            let fontColor = UIColor.red
            let fontColorSelected = UIColor.blue
            let attributeDict = [NSFontAttributeName : font,NSForegroundColorAttributeName : fontColor]
            let attributeDictSelected = [NSFontAttributeName : font,NSForegroundColorAttributeName : fontColorSelected]
            item.setTitleTextAttributes(attributeDict, for: .normal)
            item.setTitleTextAttributes(attributeDictSelected, for: .selected)
            item.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -15.0)
        }
        self.selectedItem = self.items?[0]
    }
}
