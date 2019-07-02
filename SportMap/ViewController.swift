//
//  ViewController.swift
//  SportMap
//
//  Created by Jonathan on 02/07/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ground = sportGround(title: "King David Kalakaua",
                              locationName: "Waikiki Gateway Park",
                              rating: 5.4,
                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        mapView.addAnnotation(ground)
        // Do any additional setup after loading the view.
    }


}

