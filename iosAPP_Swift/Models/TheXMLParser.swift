//
//  TheXMLParser.swift
//  iosAPP_Swift
//
//  Created by raymond on 9/27/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import UIKit
import Alamofire

class TheXMLParser: NSObject {
    init(url: String) {
        Alamofire.request(url).response { (response) in
            print(response.data)
        }
    }
}
