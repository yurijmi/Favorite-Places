//
//  Favorite+CoreDataProperties.swift
//  Favorite Places
//
//  Created by Юрий Михайлов on 08.10.15.
//  Copyright © 2015 Юрий Михайлов. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Favorite {

    @NSManaged var name: String?
    @NSManaged var longDelta: NSNumber?
    @NSManaged var long: NSNumber?
    @NSManaged var latDelta: NSNumber?
    @NSManaged var lat: NSNumber?

}
