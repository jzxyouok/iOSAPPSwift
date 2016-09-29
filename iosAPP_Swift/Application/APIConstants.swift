//
//  APIConstants.swift
//  iosAPP_Swift
//
//  Created by raymond on 9/25/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import Foundation

let BASE_REQUEST_ADDRESS = "http://www.oschina.net/action/api"
let NEWS_LIST = BASE_REQUEST_ADDRESS + "/news_list"
let NEWS_DETAIL = BASE_REQUEST_ADDRESS + "/news_detail"
let NOTIFICATION_NEWS_ARRIVE = NSNotification.Name(rawValue: "END_RETRIVE_NEWS_LIST")
let NOTIFICATION_NEWS_DETAIL = NSNotification.Name(rawValue: "END_RETRIVE_NEWS_DETAIL")
let NOTIFICATION_USERINFO_NEWS = "NewsList"
