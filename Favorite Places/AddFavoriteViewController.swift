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

class AddFavoriteViewController: UIViewController {
    
    @IBOutlet weak var nameField : UITextField!
    @IBOutlet weak var mapView   : MKMapView!
    
    var locationManager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager!.requestWhenInUseAuthorization()
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
