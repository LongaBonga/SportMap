//
//  ViewController.swift
//  SportMap
//
//  Created by Jonathan on 02/07/2019.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import SwiftyJSON
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ground = sportGround(title: "King David Kalakaua",
                              locationName: "Waikiki Gateway Park",
                              rating: 5.4,
                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        mapView.addAnnotation(ground)
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { snapshot in
            if let connected = snapshot.value as? Bool, connected {
                print("Connected")
            } else {
                print("Not connected")
            }
        })
        
        let json = JSON(ref as Any)
        print(json)
//        var names = [String]()
//        for personJSON in json["results"].arrayValue {
//            let name = personJSON["name"].stringValue
//            names.append(name)
//        }
        
    }
        // Do any additional setup after loading the view.


}

