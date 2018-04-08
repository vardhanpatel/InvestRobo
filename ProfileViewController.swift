//
//  ProfileViewController.swift
//  InvestRobo
//
//  Created by Vardhan on 4/7/18.
//  Copyright © 2018 Timoox. All rights reserved.
//

import UIKit
import WebKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var webview10: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://pr.to/BN8WUX/")
        let request = URLRequest(url: url!)
        webview10.load(request)
        // Do any additional setup after loading the view.
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
