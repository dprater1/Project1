//
//  ForgotPassViewController.swift
//  Project1
//
//  Created by Daivion Prater on 4/25/21.
//

import UIKit

class ForgotPassViewController: UIViewController {
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var message: UILabel!
    var passW : String = ""
    var count : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func savePass(_ sender: Any) {
        let data = DBHelper.inst.getData()
        count = 0
        for st in data {
            if(user.text == st.name){
                print(st.pass!)
                passW = pass.text!
                DBHelper.inst.changePassData(name: user.text!, pass: passW)
                print(st.pass!)
                message.text = "Password changed"
                break
            }
            count = count + 1
            
        }
        
        if(data.count == count){
            message.text = "Username not found, re-enter"
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
