//
//  BusLocationViewController.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 22.09.2021.
//

import UIKit
import MapKit
import CoreLocation

class BusLocationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var viewModel: BusLocationViewModel?
    let locationManager = CLLocationManager()
    
    init(viewModel: BusLocationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "BusLocationViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.stationName
        setLocationManager()
        setMapView()
    }
    
    func setLocationManager() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func setMapView() {
        let compassButton = MKCompassButton(mapView: mapView)
        compassButton.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        compassButton.compassVisibility = .visible
        mapView.addSubview(compassButton)
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue = CLLocationCoordinate2D(latitude: viewModel?.location.latitude ?? 0, longitude: viewModel?.location.longitude ?? 0)
        
        let region = MKCoordinateRegion(center: locValue, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Bus Location"
        mapView.addAnnotation(annotation)
    }
    
}
