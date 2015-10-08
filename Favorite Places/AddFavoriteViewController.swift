//
//  AddFavoriteViewController.swift
//  Favorite Places
//
//  Created by Юрий Михайлов on 08.10.15.
//  Copyright © 2015 Юрий Михайлов. All rights reserved.
//

import UIKit
import MapKit

class AddFavoriteViewController: UIViewController {
    
    @IBOutlet weak var nameField : UITextField!
    @IBOutlet weak var mapView   : MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
