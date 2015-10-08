//
//  ViewController.swift
//  Favorite Places
//
//  Created by Юрий Михайлов on 08.10.15.
//  Copyright © 2015 Юрий Михайлов. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var favorites : [Favorite] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate   = self
    }
    
    override func viewWillAppear(animated: Bool) {
        // createSampleFavorite()
        
        let request = NSFetchRequest(entityName: "Favorite")
        
        var results : [AnyObject]?
        
        do {
            results = try self.context.executeFetchRequest(request)
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.favorites = results as! [Favorite]
        }
        
        self.tableView.reloadData()
    }
    
    func createSampleFavorite() {
        let sampleFavorite = NSEntityDescription.insertNewObjectForEntityForName("Favorite", inManagedObjectContext: self.context) as! Favorite
            sampleFavorite.name      = "Kremlin"
            sampleFavorite.lat       = 55.752023
            sampleFavorite.long      = 37.617499
            sampleFavorite.latDelta  = 0.003
            sampleFavorite.longDelta = 0.003
        
        do {
            try context.save()
        } catch {}
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favorites.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let favorite = self.favorites[indexPath.row]
        
        let coordinate = CLLocationCoordinate2DMake(favorite.lat!.doubleValue, favorite.long!.doubleValue)
        let span       = MKCoordinateSpanMake(favorite.latDelta!.doubleValue, favorite.longDelta!.doubleValue)
        let region     = MKCoordinateRegionMake(coordinate, span)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mapCell") as! MapTableViewCell
            cell.nameLabel.text = favorite.name
            cell.mapView.setRegion(region, animated: false)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
