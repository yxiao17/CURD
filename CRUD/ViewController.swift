//
//  ViewController.swift
//  CRUD
//
//  Created by Yiqiong on 9/2/20.
//  Copyright © 2020 Yiqiong. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var ref:DatabaseReference?
     var databaseHandle:DatabaseHandle?
    
     var pData = [String]()
    override func viewDidLoad() {
     
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            
            // set firebase reference
            ref = Database.database().reference()
            
            // retrive the posts and listen for changes
            databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
                
                //code to execute when a child is added under "posts"
                //take the value from the snapshot and add to postData array
                let post = snapshot.value as? String
                if let actualPost = post{
                    // Append data to postDataArray
                    self.pData.append(actualPost)
                    // reload data in tableview
                    
                    self.tableView.reloadData()
                }
                
                
            })

        }

           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pData.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // this is linked to the UI since I have set the prototype cell indentifier to post
            let cell = tableView.dequeueReusableCell(withIdentifier: "post", for: indexPath)
            cell.textLabel?.text=pData[indexPath.row]
            return cell
            
           }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // delete function to delete entries
            if editingStyle == .delete {
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
            
        }
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }
        
    }

