//
//  NewsObject.swift
//  iosAPP_Swift
//
//  Created by raymond on 9/25/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import UIKit

class NewsObject: NSObject {
    var id: String?
    var title: String?
    var body: String?
    var commentCount: String?
    var author: String?
    var authorID: String?
    var pubDate: String?
    var url: String?
    var newstype: NewsType?
    
    override var description: String {
        return "===============\n\(id!)\n\(title!)\n\(body!)\n\(commentCount!)\n\(author!)\n\(authorID!)\n\(pubDate!)\n\(url!)===============\n"
    }
}
