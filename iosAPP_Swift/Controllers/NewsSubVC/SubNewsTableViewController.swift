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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.retriveNetworkDataWith(notification:)), name: NSNotification.Name(rawValue: "START_RETRIVE_NEWS_LIST"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.retriveNetworkDataWith(notification:)), name: NSNotification.Name(rawValue: "END_RETRIVE_NEWS_LIST"), object: nil)
        let parser = TheXMLParser(url: NEWS_LIST)
        print(parser)
    }
    
    func retriveNetworkDataWith(notification notif: Notification) {
        if notif.name.rawValue == "END_RETRIVE_NEWS_LIST" {
            print(notif)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // Configure the cell...
        cell.textLabel?.text = "\(indexPath.row)"
        
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
