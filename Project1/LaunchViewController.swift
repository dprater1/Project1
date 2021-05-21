//
//  LaunchViewController.swift
//  Project1
//
//  Created by Daivion Prater on 5/5/21.
//

import UIKit

class LaunchViewController: UIViewController {
    var time : Timer?
    var timeLeft = 12
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        time = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(moveLogo), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func moveLogo(){
        timeLeft -= 1
        if(timeLeft <= 0){
            time?.invalidate()
            time = nil
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var feed = sb.instantiateViewController(identifier: "view") as! ViewController
            feed.modalPresentationStyle = .fullScreen
            present(feed, animated: true, completion: nil)
            
        }
            
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
                    self.img.transform = self.img.transform.rotated(by: .pi / 2)
                                self.img.center.y -= 50                    })
                
        //var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //var feed = sb.instantiateViewController(identifier: "view") as! ViewController
        //feed.modalPresentationStyle = .fullScreen
        //present(feed, animated: true, completion: nil)
        
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
