//
//  PhoneListItem.swift
//  Phones
//
//  Created by Mirjalol Bahodirov on 6/5/18.
//  Copyright © 2018 mirjalol. All rights reserved.
//

import Foundation
import ObjectMapper

class PhoneListItem: Mappable {
    
    var title: String?
    var images: [String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        images <- map["images"]
    }
    
}
