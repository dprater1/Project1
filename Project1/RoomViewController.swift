//
//  RoomViewController.swift
//  Project1
//
//  Created by Daivion Prater on 4/25/21.
//

import UIKit

class RoomViewController: UIViewController {
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var question3: UILabel!
    @IBOutlet weak var question4: UILabel!
    @IBOutlet weak var question5: UILabel!
    @IBOutlet weak var starRating1: CosmosView!
    @IBOutlet weak var starRating2: CosmosView!
    @IBOutlet weak var starRating3: CosmosView!
    @IBOutlet weak var starRating4: CosmosView!
    @IBOutlet weak var starRating5: CosmosView!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    let ud = UserDefaults.standard
    
    
    var ratings = [Double](repeating: 0, count: 5)
    var count : Int = 0
    var room : String = "room"
    var name : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        img.alpha = 0.6
        let data = DBHelper.inst.getData()
        for st in data{
            if(st.currentUser == true){
                label.text = st.name!
            }
        }
        for st in data{
            if(ud.bool(forKey: "isSaved") == true){
            if(st.currentUser == true && st.feedback?.type != nil){
                    submit.backgroundColor = UIColor.white
                    submit.isEnabled = false
            }
            else{
                
            }
            }
            else{
                
            }
            
        }
        starRating1.settings.fillMode = .half
        starRating1.didFinishTouchingCosmos = {
            rate in
            self.ratings[0] = rate
        }
        starRating2.settings.fillMode = .half
        starRating2.didFinishTouchingCosmos = {
            rate in
            self.ratings[1] = rate
        }
        starRating3.settings.fillMode = .half
        starRating3.didFinishTouchingCosmos = {
            rate in
            self.ratings[2] = rate
        }
        starRating4.settings.fillMode = .half
        starRating4.didFinishTouchingCosmos = {
            rate in
            self.ratings[3] = rate
        }
        starRating5.settings.fillMode = .half
        starRating5.didFinishTouchingCosmos = {
            rate in
            self.ratings[4] = rate
        }
                    
    }
    
    @IBAction func submitData(_ sender: UIButton) {
        if(ratings[0] != 0 && ratings[1] != 0 && ratings[2] != 0 && ratings[3] != 0 && ratings[4] != 0){
                DBHelper.inst.addFeedbackData(question: question1.text!,stars: ratings[0], type: room)
                DBHelper.inst.addFeedbackData(question: question2.text!,stars: ratings[1],type: room)
                DBHelper.inst.addFeedbackData(question: question3.text!,stars: ratings[2], type: room)
                DBHelper.inst.addFeedbackData(question: question4.text!,stars: ratings[3],type: room)
                DBHelper.inst.addFeedbackData(question: question5.text!,stars: ratings[4], type: room)
        
        var data = DBHelper.inst.getFeedbackDataFive()
        //print(data)
        let data2 = DBHelper.inst.getData()
        print(data2)
            count = count + 1
                for st in data2{
                    if(st.currentUser != true){
                        continue
                    }
                    else{
                        for feed in data{
                            //print(feed)
                            DBHelper.inst.addFeedbackToUser(user: st,feed: feed)
                            print(st.feedback!.type!,": \n", st.name!," is the user who answered question", st.feedback!.question!, "with this many stars:", st.feedback!.stars)
                            
                            
                        }
                        //print(st.feedback!)
                    }
                }
                
                
                
                
                
                
            
                
        /*print(data2)
                //for feed in data {
                //DBHelper.inst.addFeedbackData(question: feed.question!, stars: feed.stars)
                //print(feed.stars)
                for st in data2{
                    
                    
                    if(st.currentUser == true){
                        for i in 1..<data.count+1{
                            if(i < 7){
                            DBHelper.inst.addFeedbackToUser(user: st,feed: data[data.count-i])
                            if(st.feedback?.type != nil){
                            print(st.feedback!.type!,": \n", st.name!," is the user who answered question", st.feedback!.question!, "with this many stars:", st.feedback!.stars, "this is the count", count)
                            }
                            }
                            }
                            
                        //print(st.feedback!)
                            }
                        }*/
                        
                //}
            
                sender.backgroundColor = UIColor.white
                sender.isEnabled = false
                count = count + 1
            //else{
              //  print("no value and stars is ", feed.stars)
            //}

                
        
        }
        else{
            print("Answer all the questions please")
        }
 

        ud.set(true, forKey: "isSaved")
        FeedbackViewController.feedbackState = true
        FeedbackViewController.starValues1 = ratings[0]
        FeedbackViewController.starValues2 = ratings[1]
        FeedbackViewController.starValues3 = ratings[2]
        FeedbackViewController.starValues4 = ratings[3]
        FeedbackViewController.starValues5 = ratings[4]
        FeedbackViewController.avgStarsValue = (FeedbackViewController.starValues1 + FeedbackViewController.starValues2 + FeedbackViewController.starValues3 + FeedbackViewController.starValues4 + FeedbackViewController.starValues5) / 5.0
        print(FeedbackViewController.avgStarsValue)
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        
        let vc = FeedbackViewController()
        
        //vc.room?.isEnabled = false
        //vc.roomButton.setImage( "", for: .disabled)
        
        
        
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "food") as! FoodViewController
        feed.modalPresentationStyle = .fullScreen
        present(feed, animated: true, completion: nil)
    }
    
    @IBAction func mainMenu(_ sender: Any) {
       // let data = DBHelper.inst.getData()
        //for st in data{
          //  print(st.feedback!)
        //}
        //DBHelper.inst.deleteData()
        //DBHelper.inst.resetAllEntities("FeedbackInfo")
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


