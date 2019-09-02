//
//  FavoriteItem+CoreDataProperties.swift
//
//
//  Created by Vinicius Mangueira on 02/09/19.
//
//

import Foundation
import CoreData


extension FavoriteItem {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteItem> {
        return NSFetchRequest<FavoriteItem>(entityName: "FavoriteItem")
    }
    
    @NSManaged public var title: String?
    @NSManaged public var about: String?
    @NSManaged public var gallery: String?
    
}
