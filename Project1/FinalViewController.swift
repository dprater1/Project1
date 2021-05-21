//
//  FinalViewController.swift
//  Project1
//
//  Created by Daivion Prater on 5/5/21.
//

import UIKit

class FinalViewController: UIViewController {
    var avgstars = 0.0

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label2: UILabel!
    var time : Timer?
    var timeLeft = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        avgstars = (FeedbackViewController.avgStarsValue + FeedbackViewController.avgStarsValue2 + FeedbackViewController.avgStarsValue3 + FeedbackViewController.avgStarsValue4 +
            FeedbackViewController.avgStarsValue5)/5.0
        let data = DBHelper.inst.getData()
        for st in data{
            if(st.currentUser == true){
                DBHelper.inst.addAvgStarsToUser(user: st, stars: avgstars)
                label2.text = st.name!
                label2.text! += " thank you very much for providing your feedback!"
                print(st.feedback!.avgStars)
                
            }
        }
        if(avgstars >= 3){
            
            label.text = "Positive Feedback is our favorite! Please come back soon!"
            img.backgroundColor = UIColor.clear
            img.image = UIImage(named: "10-102025_smiley-face-png-transparent-png-removebg-preview")
            
            time = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(moveLogo), userInfo: nil, repeats: true)
        }
        else{
            label.text = "I'm sorry your stay was unsatisfactory, please contact us to discuss what went wrong."
            img.image = UIImage(named: "Image_2-removebg-preview")
            
        }
        // Do any additional setup after loading the view.
    }
    @objc func moveLogo(){
        timeLeft -= 1
        if(timeLeft <= 0){
            time?.invalidate()
            time = nil
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.img.transform = self.img.transform.rotated(by: .pi / 2)
                                          
        })
        
    }

    @IBAction func signOut(_ sender: Any) {
        
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var feed = sb.instantiateViewController(identifier: "view") as! ViewController
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
