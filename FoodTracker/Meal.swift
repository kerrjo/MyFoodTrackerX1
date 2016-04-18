//
//  Meal.swift
//  FoodTracker
//
//  Created by JOSEPH KERR on 3/2/16.
//  Copyright © 2016 JOSEPH KERR. All rights reserved.
//

import UIKit

// subclass of NSObject to get NSCoding behavior

class Meal: NSObject, NSCoding {
    
    // MARK: properties
    
    var name : String
    var photo : UIImage?
    var rating : Int
    
    // MARK: Archiving paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    // MARK: Types
    
    struct propertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: initializers
    
    init?(name: String, photo: UIImage? , rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: propertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: propertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: propertyKey.ratingKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(propertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(propertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(propertyKey.ratingKey)
        
        self.init(name:name, photo: photo, rating: rating)
    }
    
}


/*
Lesson: the designated failable initializer was fine wo super.init but when adding the convenience init
it required the desig initializer to call super

*/
