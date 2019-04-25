//
//  ViewController.swift
//  Aula10
//
//  Created by Ronaldo Tavares da Silva on 27/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        locationManager.delegate = self
        
        mapView.addAnnotation(mapView.userLocation)

        enableLocationServices()
        
        let GCLocation = CLLocation(latitude: -23.573991, longitude: -46.641956)
        addPin(title: "Global Code", location: GCLocation)
    }
    
    func enableLocationServices(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        switch CLLocationManager.authorizationStatus() {
        case .denied, .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func addPin(title: String?, location: CLLocation?){
        guard let location = location else {return}
        
        let pin = MKPointAnnotation()
        pin.title = title
        pin.coordinate = location.coordinate
        
        mapView.addAnnotation(pin)
    }
    
    @objc func searchLocations(){
        guard let mapView = mapView, let text = searchBar.text else {return}
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = text
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }

            let annotationsToRemove = mapView.annotations //.filter { $0 !== mapView.userLocation}
            mapView.removeAnnotations(annotationsToRemove)
            
            _ = response.mapItems.compactMap{ item in
                self.addPin(title: item.placemark.name, location: item.placemark.location)
            }
            
            self.view.endEditing(true)
        }
        
        print(text)
    }
}

extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        guard let location = locations.last else {return}
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        
        let viewRegion = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        switch CLLocationManager.authorizationStatus() {
        case .denied, .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
}

extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation){
//        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
//        let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, span: span)
//
//        mapView.setRegion(viewRegion, animated: false)
    }
}
