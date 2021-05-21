//
//  UserInfo+CoreDataProperties.swift
//  Project1
//
//  Created by Daivion Prater on 5/4/21.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var currentUser: Bool
    @NSManaged public var name: String?
    @NSManaged public var pass: String?
    @NSManaged public var feedback: FeedbackInfo?

}

extension UserInfo : Identifiable {

}
