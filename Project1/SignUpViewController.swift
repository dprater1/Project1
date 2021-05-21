//
//  SignUpViewController.swift
//  Project1
//
//  Created by Daivion Prater on 4/25/21.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var userSignUp: UITextField!    
    @IBOutlet weak var passSignUp: UITextField!
    
    @IBOutlet weak var label: UILabel!
    var count : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SignUp(_ sender: Any) {
       
        
        if(passSignUp.text!.count >= 5){
        let dic = ["name" : userSignUp.text , "pass" : passSignUp.text]
        DBHelper.inst.addData(object: dic as! [String:String])
        let data = DBHelper.inst.getData()
        for st in data {
            if(st.name != nil && st.pass != nil){
            print(st.name!, st.pass!)
            label.text = ("Thanks for signing up with us!")
            }
            
        }
            print(data)
        }
        else{
            label.text = ("Please create a longer password")
        }
        
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
