//
//  ViewController.swift
//  Aula7
//
//  Created by Ronaldo Tavares da Silva on 14/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var segmentedControlType: UISegmentedControl!
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var names: [String] = []
    var dogs: [String] = []
    var cats: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UINib(nibName: "CatTableViewCell", bundle: nil), forCellReuseIdentifier: "catCell")
        tableView.register(UINib(nibName: "DogTableViewCell", bundle: nil), forCellReuseIdentifier: "dogCell")
    }

    @IBAction func actionAddItem(_ sender: Any) {
        guard let item = textFieldInput.text, item.count > 2 else{
            return
        }
        
        switch segmentedControlType.selectedSegmentIndex {
        case 0:
            names.append(item)
        case 1:
            dogs.append(item)
        case 2:
            cats.append(item)
        default:
            names.append(item)
        }
        
        
        tableView.reloadData()
    }
    
    @IBAction func actionRandomizer(_ sender: Any) {
    }
}

extension ViewController: UITextViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return names.count
        case 1:
            return dogs.count
        default:
            return cats.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var item : String
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemViewCell", for: indexPath) as! ItemTableViewCell
            item = names[indexPath.row]
            
            cell.labelItem.text = item
            cell.labelTitle.text = "Item: \(indexPath.row+1)"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dogCell", for: indexPath) as! DogTableViewCell
            item = dogs[indexPath.row]
            
            cell.labelName.text = item
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath) as! CatTableViewCell
            item = cats[indexPath.row]
            
            cell.labelName.text = item
            return cell
        default:
            return UITableViewCell()
        }
    }
}
