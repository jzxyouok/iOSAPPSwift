//
//  SubNewsTableViewController.swift
//  iOSAppSwift
//
//  Created by raymond on 9/21/16.
//  Copyright © 2016 raymond. All rights reserved.
//

import UIKit
import MBProgressHUD

class SubNewsTableViewController: UITableViewController {
    var hudView: MBProgressHUD? //一朵菊花在这播种, 怎么开不起来...
    var newsList: [NewsObject] = [NewsObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "NewsListcell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "NewsListCell")
        NotificationCenter.default.addObserver(self, selector: #selector(self.retriveNetworkDataWith(notification:)), name: NSNotification.Name(rawValue: "START_RETRIVE_NEWS_LIST"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.retriveNetworkDataWith(notification:)), name: NSNotification.Name(rawValue: "END_RETRIVE_NEWS_LIST"), object: nil)
        let parser = TheXMLParser(url: NEWS_LIST)
        print(parser)
    }
    
    func retriveNetworkDataWith(notification notif: Notification) {
        if notif.name.rawValue == "END_RETRIVE_NEWS_LIST" {
            self.newsList = notif.userInfo?["NewsList"]! as! [NewsObject]
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.newsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell") as! NewsTableViewCell
        // Configure the cell...
        if self.newsList.count > 0 {
            cell.textLabel?.text = self.newsList[indexPath.row].author
        }
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
}
