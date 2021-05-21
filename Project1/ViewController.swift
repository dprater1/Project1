//
//  ViewController.swift
//  Project1
//
//  Created by Daivion Prater on 4/25/21.
//

import UIKit

class ViewController: UIViewController {
    let ud = UserDefaults.standard
    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var swt: UISwitch!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var label: UILabel!
    var count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.text = ud.string(forKey : "id")
        pass.text = ud.string(forKey : "pass")
        swt.isOn = ud.bool(forKey: "swt")        // Do any additional setup after loading the view.
    }
    @IBAction func signIn(_ sender: Any) {
        let data = DBHelper.inst.getData()
        count = 0
        //let data2 = DBHelper.inst.getLastData(name: user.text!)
        for st in data{
            if(user.text == st.name && pass.text == st.pass){
                    print("Correct Username and Pass")
                DBHelper.inst.currentUser(name: st.name!, user : true)
                count = 0
                nextScreen()
                
            }
            else{
                if(st.name != nil){
                DBHelper.inst.currentUser(name: st.name!, user : false)
                }
            }
            count = count + 1
            }
        print(count)
        print(data.count)
        if(data.count == count){
            //label.text = ("No one found with this combo")
        }
    
    }
    
    @IBAction func rememberMe(_ sender: UISwitch) {
        let data = DBHelper.inst.getData()
        //let data2 = DBHelper.inst.getLastData(name: user.text!)
        count = 0
        for st in data{
            if(user.text == st.name && pass.text == st.pass){
            if (swt.isOn){
                
            ud.set(st.name!, forKey : "id")
            ud.set(st.pass!, forKey : "pass")
            ud.set(swt.isOn, forKey: "swt")
            count = count + 1
            label.text = ""
            break
                
                }
            }
            else if(swt.isOn == false){
            
            ud.removeObject(forKey: "id")
            ud.removeObject(forKey: "pass")
            ud.set(swt.isOn, forKey: "swt")
            count = 2
        }
        
            if(count == 0){
                //label.text = "Enter a correct Username and Password to remember"
            }
        }
    
    
    }
    
    func nextScreen(){
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "feedback") as! FeedbackViewController
        feed.modalPresentationStyle = .fullScreen
        present(feed, animated: true, completion: nil)
        
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
