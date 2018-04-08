//
//  ViewController2.swift
//  InvestRobo
//
//  Created by Vardhan on 4/7/18.
//  Copyright © 2018 Timoox. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


class ViewController2: UIViewController {
    var dbref: DatabaseReference?
    var ref: DatabaseReference?
    var dbHandle: DatabaseHandle?
    @IBOutlet weak var stock1text: UILabel!
    @IBOutlet weak var stock2text: UILabel!
    @IBOutlet weak var stock3text: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference(withPath: "stock1")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            
            let stock11 = snapshot.childSnapshot(forPath: "-L9WTmonXTJv8U1II6Qg").value
            print(stock11!)
            self.stock1text.text = stock11 as! String
            
            let stock12 = snapshot.childSnapshot(forPath: "-L9WTmonXTJv8U1II6Qh").value
            print(stock12!)
            self.stock2text.text = stock12 as! String
            
            let stock13 = snapshot.childSnapshot(forPath: "-L9WWTHrAQiHo3IY3cwC").value
            print(stock13!)
            self.stock3text.text = stock13 as! String
            

            

            
        })
        
  
            
       
            
    }

        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
