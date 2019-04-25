//
//  CountryViewController.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 28/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var tableViewCountry: UITableView!
    
    @IBOutlet weak var buttonPackagesNumber: UIButton!
    
    var timer: Timer?

    var teams: [Team] = []
    var packages = 0
    let timeToNewPackage = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        packages = UserDefaults.standard.integer(forKey: "packageCount")
        self.buttonPackagesNumber.setTitle(String(packages), for: UIControl.State.normal)
        
        timer = Timer.scheduledTimer(timeInterval: timeToNewPackage, target: self, selector: #selector (newPackage), userInfo: nil, repeats: false)
        
        Team.getTeams{ [weak self] teams, error in
            guard let self = self else {return}
            
            self.teams = teams
            
            self.tableViewCountry.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        switch identifier {
        case "showPlayers":
            let playerVC = segue.destination as! PlayerViewController
            
            playerVC.teamIndex = sender as? Int ?? 0
            playerVC.teams = teams
        case "getPackages":
            _ = segue.destination as! PackageViewController
        default:
            return
        }
    }
    
    @objc func newPackage(){
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: timeToNewPackage, target: self, selector: #selector (newPackage), userInfo: nil, repeats: false)

        packages = packages+1
//        teste para diminuir pacotes
//        packages = 1
        UserDefaults.standard.set(packages, forKey: "packageCount")

        self.buttonPackagesNumber.setTitle(String(packages), for: UIControl.State.normal)
    }
    
    
    @IBAction func buttonOpenPackages(_ sender: Any) {
         performSegue(withIdentifier: "getPackages", sender: nil)
    }
}

extension CountryViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! CountryTableViewCell

        let team = teams[indexPath.row]
        cell.labelTeam.text = team.name
        let urlString  = team.flag?.url ?? ""
        let url = URL(string: urlString)
        cell.imageViewCountry.kf.setImage(with: url)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "showPlayers", sender: indexPath.row)
    }
}
