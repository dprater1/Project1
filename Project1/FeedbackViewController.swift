//
//  FeedbackViewController.swift
//  Project1
//
//  Created by Daivion Prater on 4/25/21.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var roomButton: UIButton!
    
    @IBOutlet weak var foodButton: UIButton!
    
    @IBOutlet weak var spaButton: UIButton!
    
    @IBOutlet weak var gymButton: UIButton!
    
    @IBOutlet weak var overallButton: UIButton!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var roomImg: UIImageView!
    @IBOutlet weak var foodimg: UIImageView!
    @IBOutlet weak var spaImg: UIImageView!
    @IBOutlet weak var gymImg: UIImageView!
    @IBOutlet weak var overallImg: UIImageView!
    
    
    
    let ud = UserDefaults.standard
    
    
    
    static var feedbackState : Bool = false
    static var feedbackState1 : Bool = false
    static var feedbackState2 : Bool = false
    static var feedbackState3 : Bool = false
    static var feedbackState4 : Bool = false

    static var starValues1 : Double = 0.0
    static var starValues2 : Double = 0.0
    static var starValues3 : Double = 0.0
    static var starValues4 : Double = 0.0
    static var starValues5 : Double = 0.0
    static var avgStarsValue : Double = 0.0
    static var avgStarsValue2 : Double = 0.0
    static var avgStarsValue3 : Double = 0.0
    static var avgStarsValue4 : Double = 0.0
    static var avgStarsValue5 : Double = 0.0
    
    
    
    
    var room : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        img.alpha = 0.6
        room = roomButton
        roomButton.isEnabled = true
        print(FeedbackViewController.feedbackState)
        if (FeedbackViewController.feedbackState == true){
            ud.set(true,forKey:"room")
            if(ud.bool(forKey: "room")){
            roomImg.image = UIImage(named: "checkmark")
            //FeedbackViewController.feedbackState = true
             
            print("ok")
            }
        }
        if (FeedbackViewController.feedbackState1 == true){
            ud.set(true,forKey:"food")
            if(ud.bool(forKey: "food")){
            foodimg.image = UIImage(named: "checkmark")
            //FeedbackViewController.feedbackState1 = true
                
            }
        }
        
        if (FeedbackViewController.feedbackState2 == true){
            ud.set(true,forKey:"spa")
            if(ud.bool(forKey: "spa")){
            spaImg.image = UIImage(named: "checkmark")
            //FeedbackViewController.feedbackState2 = true

        }
        }
        if (FeedbackViewController.feedbackState3 == true){
            ud.set(true,forKey:"gym")
            if(ud.bool(forKey: "gym")){
            gymImg.image = UIImage(named: "checkmark")
            //FeedbackViewController.feedbackState3 = true
              
            }
        }
        if (FeedbackViewController.feedbackState4 == true){
            ud.set(true,forKey:"overall")
            if(ud.bool(forKey: "overall")){
            overallImg.image = UIImage(named: "checkmark")
            //FeedbackViewController.feedbackState4 = true
            }
        }
        if(FeedbackViewController.feedbackState == true && FeedbackViewController.feedbackState2 == true && FeedbackViewController.feedbackState3 == true && FeedbackViewController.feedbackState3 == true && FeedbackViewController.feedbackState4 == true ){
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var feed = sb.instantiateViewController(identifier: "final") as! FinalViewController
            feed.modalPresentationStyle = .fullScreen
            present(feed, animated: true, completion: nil)
            
        }
        // Do any additional setup after loading the view.
        
    }
    @IBAction func roomButton(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "room") as! RoomViewController
        feed.modalPresentationStyle = .fullScreen
        present(feed, animated: true, completion: nil)
        
    }
    @IBAction func foodButton(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "food") as! FoodViewController
        feed.modalPresentationStyle = .fullScreen
        present(feed, animated: true, completion: nil)
        
    }
    @IBAction func spaButon(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "spa") as! SpaViewController
        feed.modalPresentationStyle = .fullScreen
        present(feed, animated: true, completion: nil)
        
    }
    @IBAction func gymButton(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "gym") as! GymViewController
        feed.modalPresentationStyle = .fullScreen
        present(feed, animated: true, completion: nil)
    }
    @IBAction func overallButton(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "overall") as! OverallViewController
        feed.modalPresentationStyle = .fullScreen
        present(feed, animated: true, completion: nil)
    }
    
    @IBAction func signOut(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "view") as! ViewController
        feed.modalPresentationStyle = .fullScreen
        present(feed, animated: true, completion: nil)
    }
    
    @IBAction func deleteall(_ sender: Any) {
        DBHelper.inst.resetAllEntities("UserInfo")
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
