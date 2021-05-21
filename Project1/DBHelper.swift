//
//  DBHelper.swift
//  Project1
//
//  Created by Daivion Prater on 4/28/21.
//

import Foundation
import CoreData
import UIKit

class DBHelper {
    static var inst = DBHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addData(object : [String:String]){
        let userInfo = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: context!) as! UserInfo
        //let feedbackInfo = NSEntityDescription.insertNewObject(forEntityName: "FeedbackInfo", into: context!) as! FeedbackInfo
        userInfo.name = object["name"]
        userInfo.pass = object["pass"]
        
        do{
            try context?.save()
            print("data saved")
        
        }
        catch{
            print("data not saved")
        }
    }
    func getData()-> [UserInfo]{
        var stu = [UserInfo]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        fetchReq.returnsObjectsAsFaults = false
        do{
            stu = try context?.fetch(fetchReq) as! [UserInfo]
        }
        catch{
            print("can not fetch any data")
        }

        return stu
    }
    
    func changePassData(name : String, pass: String){
        var st = UserInfo()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserInfo")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)
        fetchReq.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [UserInfo]
            if(req.count != 0){
                st = req.first as! UserInfo
                st.pass = pass
                try context?.save()
                print("data is updated")
                
            }
        else{
            print("Data not found")
        }
        }
        catch{
            print("")
        }
    }
    func currentUser(name: String, user: Bool){
        var st = UserInfo()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserInfo")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)
        fetchReq.fetchLimit = 1
        do{
            let req = try context?.fetch(fetchReq) as! [UserInfo]
            if(req.count != 0){
                st = req.last as! UserInfo
                st.currentUser = user
                try context?.save()
                
            }
        else{
            print("Data not found")
        }
        }
        catch{
            print("")
        }
        
    }
    
    
    
    
    func updateData(object : [String:String]){
        
        var st = UserInfo()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserInfo")
        fetchReq.predicate = NSPredicate(format: "name == %@", object["name"]!)
        do{
            let stu = try context?.fetch(fetchReq)
            
            if(stu?.count != 0){
                st = stu?.first as! UserInfo
                
                st.pass = object["pass"]
                try context?.save()
                print("data is updated")
            }
        }
        catch{
            print("")
        }
        
        
        
    }
    
    func addFeedbackToUser(user: UserInfo,feed: FeedbackInfo){
        var feedbackInfo = NSEntityDescription.insertNewObject(forEntityName: "FeedbackInfo", into: context!) as! FeedbackInfo
    
        feedbackInfo = feed
        //print(feed)
        user.feedback = feedbackInfo
        //print(user.feedback!)
        do{
            try context?.save()
            print("data saved")
        
        }
        catch{
            print("data not saved")
        }
    }
    func addAvgStarsToUser(user: UserInfo,stars: Double){
        var feedbackInfo = NSEntityDescription.insertNewObject(forEntityName: "FeedbackInfo", into: context!) as! FeedbackInfo
    
        
        //print(feed)
        user.feedback?.avgStars = stars
        //print(user.feedback!)
        do{
            try context?.save()
            print("data saved")
        
        }
        catch{
            print("data not saved")
        }
    }
    
    
    func addUserToFeedback(user: UserInfo,feed: FeedbackInfo){
        var userInfo = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: context!) as! UserInfo
        
        userInfo = user
        //feed.users?.(userInfo)
        do{
            try context?.save()
            print("data saved")
        
        }
        catch{
            print("data not saved")
        }
    }
    
    func deleteData(){
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "UserInfo")
        
        
        do{
            let st = try context?.fetch(fetchReq)
            context?.delete(st?.first as! UserInfo)
            try context?.save()        }
        catch{
            do{
                try context?.save()
                print("data deleted")
            }catch{
                print("data not deleted")
            }
        }
    }
    
    func addFeedbackData(question : String, stars : Double, type: String){
        let feedbackInfo = NSEntityDescription.insertNewObject(forEntityName: "FeedbackInfo", into: context!) as! FeedbackInfo
        
        feedbackInfo.question = question
        feedbackInfo.stars = stars
        feedbackInfo.type = type
        
        do{
            try context?.save()
            print("data saved")
        
        }
        catch{
            print("data not saved")
        }
        
    }
    
    
    func getFeedbackData()-> [FeedbackInfo]{
        var feed = [FeedbackInfo]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "FeedbackInfo")
                do{
            feed = try context?.fetch(fetchReq) as! [FeedbackInfo]
        }
        catch{
            print("can not fetch any data")
        }
        return feed
    }
    func getFeedbackDataFive() -> [FeedbackInfo]{
        var feed = [FeedbackInfo]()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "FeedbackInfo")
        //var sort = NSSortDescriptor(key: "type", ascending: false)
        //fetchReq.sortDescriptors = [sort]
        fetchReq.returnsObjectsAsFaults = false
        //fetchReq.fetchLimit = 5
        do{
        
            var req = try context?.fetch(fetchReq) as! [FeedbackInfo]
            
            print(req)
            feed.append(req[req.count - 1])
            feed.append(req[req.count - 2])
            feed.append(req[req.count - 3])
            feed.append(req[req.count - 4])
            feed.append(req[req.count - 5])
        
        }
        catch{
            print("")
        }
        print(feed)
        return feed
    }
    func deleteFeedbackData(){
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "FeedbackInfo")
        
        
        do{
            let st = try context?.fetch(fetchReq)
            context?.delete(st?.first as! FeedbackInfo)
            try context?.save()        }
        catch{
            do{
                try context?.save()
                print("data deleted")
            }catch{
                print("data not deleted")
            }
        }
    }
    func resetAllEntities(_ entity : String){
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteReq = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do{
            try context?.execute(deleteReq)
            try context?.save()
            
        }
        catch {
            print("error")
        }
    }
}
