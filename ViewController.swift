//
//  ViewController.swift
//  InvestRobo
//
//  Created by Vardhan on 4/7/18.
//  Copyright © 2018 Timoox. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase




class ViewController: UIViewController{
    var dbref: DatabaseReference?
    var dbHandle: DatabaseHandle?
    
   
    @IBAction func endkeyboard(_ sender: Any) {
        
        view.endEditing(true)

        
        
    }
    @IBOutlet weak var firstnametext: UITextField!
    @IBOutlet weak var lastnametext: UITextField!
    @IBOutlet weak var welcomename: UILabel!
    @IBOutlet weak var stock1: UITextField!
    @IBOutlet weak var stock2: UITextField!
    @IBOutlet weak var stock3: UITextField!
    @IBAction func endkeys(_ sender: Any) {

        view.endEditing(true)

    }
    @IBOutlet weak var currentlabel: UILabel!
    @IBOutlet weak var depositinput: UITextField!
     @IBOutlet weak var withdrawinput: UITextField!
    


    @IBAction func depositsubmit(_ sender: AnyObject) {
        
            if let a = Int(depositinput.text!) {
                var b = Int(currentlabel.text!)
                currentlabel.text = "\(b!+a)"
            } else {
                currentlabel.text = "That doesn't look like a number!"
            }
            
        }
    
  
    @IBOutlet weak var theirname: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var origamount:String = ""
    
    @IBAction func withdrawinput(_ sender: Any) {
        
       let a = Int(depositinput.text!)
        let d = Int(currentlabel.text!)
        let b = Int(withdrawinput.text!)
        let c = Int(d!-b!)
        currentlabel.text = "\(c)"
    }
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var firstname: UITextField!
   
    var x:String = ""
    var y:String = ""
    var z:String = ""
    
   
    
   // @IBAction func submitstocks(_ sender: Any) {
       
     //
      //  let x:String  = stock1.text!
//let y:String  = stock2.text!
      ///   let z:String  = stock3.text!
      
   // }
    
    @IBOutlet weak var lastname: UITextField!
    
    @IBAction func logout(_ sender: Any) {
        
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    @IBAction func login(_ sender: Any)
    {
        
       
            if self.emailText.text == "" || self.passwordText.text == "" || self.firstnametext.text == ""  {
                
                //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
                
                let alertController = UIAlertController(title: "Error", message: "Please enter an Email,Password and First Name.", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                
                Auth.auth().signIn(withEmail: self.emailText.text!, password: self.passwordText.text!) { (user, error) in
                    
                    if error == nil {
                        
                        //Print into the console if successfully logged in
                        print("You have successfully logged in")
                        
                        //Go to the HomeViewController if the login is sucessful
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "yourstocks")
                        self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        
                        //Tells the user that there is an error and then gets firebase to tell them the error
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
      
    }


    @IBAction func action(_ sender: UIButton) {
        
        if emailText.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
        }
        
       
        
        dbref = Database.database().reference()
        
        
        dbref?.child(firstnametext.text!).childByAutoId().setValue(stock1)
        dbref?.child(firstnametext.text!).childByAutoId().setValue(stock2)
        dbref?.child(firstnametext.text!).childByAutoId().setValue(stock3)

         }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
}

