//
//  FeedbackInfo+CoreDataProperties.swift
//  Project1
//
//  Created by Daivion Prater on 5/4/21.
//
//

import Foundation
import CoreData


extension FeedbackInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FeedbackInfo> {
        return NSFetchRequest<FeedbackInfo>(entityName: "FeedbackInfo")
    }

    @NSManaged public var avgStars: Double
    @NSManaged public var question: String?
    @NSManaged public var stars: Double
    @NSManaged public var type: String?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension FeedbackInfo {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: UserInfo)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: UserInfo)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension FeedbackInfo : Identifiable {

}
