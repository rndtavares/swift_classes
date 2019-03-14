//
//  ViewController.swift
//  Aula7
//
//  Created by Ronaldo Tavares da Silva on 14/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionAddItem(_ sender: Any) {
        guard let item = textFieldInput.text, item.count > 2 else{
            return
        }
        
        names.append(item)
        tableView.reloadData()
    }
    
    @IBAction func actionRandomizer(_ sender: Any) {
    }
}

extension ViewController: UITextViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemViewCell", for: indexPath) as! ItemTableViewCell
        
        let item = names[indexPath.row]
        
        cell.labelItem.text = item
        cell.labelTitle.text = "Item: \(indexPath.row+1)"
        
        return cell
    }
}
