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
    var arr = [Any]()
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
        for i in 4588...4600
        {
            
            let data = Database
                .database(url: "https://sportmap-740d5.firebaseio.com/")
                .reference()
                .child("\(i)")
            
            
            data.observe(.value) { snapshot in
                var latitude = snapshot.childSnapshot(forPath: "geoData/coordinates/1").value as! Double
                var longitude = snapshot.childSnapshot(forPath:"geoData/coordinates/0").value as! Double
                var titleName = snapshot.childSnapshot(forPath:"ObjectName").value as! String
                var location = snapshot.childSnapshot(forPath:"Address").value as! String
                //print(snapshot, terminator: " ")
                let ground = sportGround(title: titleName,
                                         locationName: location,
                                         coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                self.mapView.addAnnotation(ground)
            }
            
            
            
           
            
//            let emailReference = Database
//                .database(url: "https://sportmap-740d5.firebaseio.com/")
//                .reference()
//                .child("\(i)")
//                .child("Email")
//
//            print(emailReference)
//            emailReference.observe(.value) { snapshot in
//                print(snapshot)
//                print("Success")
//            }
            
            
        }
        let connectedRef = Database.database().reference(withPath: ".info/connected") // check connecting with Firebase
        connectedRef.observe(.value, with: { snapshot in
            if snapshot.value as? Bool ?? false {
                
                print("CONNECTED")
                
                print(" dataBase was download")
                
                
            } else {
                print("Not connected")
            }
        })
        
 
        
       
        
        
        
        let ground = sportGround(title: "King David Kalakaua",
                                 locationName: "Waikiki Gateway Park",
                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        mapView.addAnnotation(ground)
        
        



       
    }
        // Do any additional setup after loading the view.


}

