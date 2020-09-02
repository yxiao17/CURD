//
//  ComposeViewController.swift
//  CRUD
//
//  Created by Yiqiong on 9/2/20.
//  Copyright © 2020 Yiqiong. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var ref:DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func add(_ sender: Any) {
        ref?.child("Posts").childByAutoId().setValue(textView.text)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel(_ sender: Any) {
         presentingViewController?.dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
