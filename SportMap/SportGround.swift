//
//  SportGround.swift
//  SportMap
//
//  Created by Jonathan on 02/07/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation
import MapKit

class sportGround: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let rating: Float
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, rating: Float, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.rating = rating
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
