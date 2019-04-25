//
//  NewViewController.swift
//  Aula10
//
//  Created by Ronaldo Tavares da Silva on 27/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Contacts

class Database{
    static var placemarks: [CLPlacemark] = []
}

class NewViewController: UIViewController {

    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var places: [MKPlacemark] = []
    let locationManager = CLLocationManager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func searchLocations(){
        guard let text = searchBar.text else {return}
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = text
        let search = MKLocalSearch(request: request)
        places = []
        
        search.start { response, _ in
            guard let response = response else {
                return
            }
            
            _ = response.mapItems.compactMap{ item in
                self.places.append(item.placemark)
            }
            
            self.tableView.reloadData()
            self.view.endEditing(true)
        }
        
        print(text)
    }
}

extension NewViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector (searchLocations), userInfo: nil, repeats: false)
    }
}

extension NewViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell

        let place = places[indexPath.row]
        cell.label.text = place.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let place = places[indexPath.row]
        
        Database.placemarks.append(place)
    }
}
