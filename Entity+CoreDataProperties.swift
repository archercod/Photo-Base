//
//  Entity+CoreDataProperties.swift
//  Photo Base
//
//  Created by Marcin Pietrzak on 18.07.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var titletext: String?
    @NSManaged public var descriptiontext: String?
    @NSManaged public var image: NSData?

}
