//
//  Baby.swift
//  TripCard
//
//  Created by 蔡鈞 on 2016/9/15.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import Foundation
import UIKit

class Baby: NSObject {
    
    var tripId = ""
    var city = ""
    var country = ""
    var featuredImage:UIImage?
    var price:Int = 0
    var totalDays:Int = 0
    var isLiked = false
    
    
    init(tripId: String, city: String, country: String, featuredImage: UIImage!, price: Int, totalDays: Int, isLiked: Bool) {
        self.tripId = tripId
        self.city = city
        self.country = country
        self.featuredImage = featuredImage
        self.price = price
        self.totalDays = totalDays
        self.isLiked = isLiked
    }
}
