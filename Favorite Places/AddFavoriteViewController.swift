//
//  AddFavoriteViewController.swift
//  Favorite Places
//
//  Created by Юрий Михайлов on 08.10.15.
//  Copyright © 2015 Юрий Михайлов. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class AddFavoriteViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var nameField : UITextField!
    @IBOutlet weak var mapView   : MKMapView!
    
    var locationManager : CLLocationManager?
    var gotLocation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager!.requestWhenInUseAuthorization()
        
        self.locationManager!.delegate = self
        self.locationManager!.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if self.gotLocation.boolValue == false {
            let region = MKCoordinateRegionMakeWithDistance(self.locationManager!.location!.coordinate, 1000, 1000)
            
            self.mapView.setRegion(region, animated: true)
            
            self.gotLocation = true
        }
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneTapped(sender: AnyObject) {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let newFavorite = NSEntityDescription.insertNewObjectForEntityForName("Favorite", inManagedObjectContext: context) as! Favorite
            newFavorite.name       = self.nameField.text
            newFavorite.lat        = self.mapView.region.center.latitude
            newFavorite.long       = self.mapView.region.center.longitude
            newFavorite.latDelta   = self.mapView.region.span.latitudeDelta
            newFavorite.longDelta  = self.mapView.region.span.longitudeDelta
        
        do {
            try context.save()
        } catch {}
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
