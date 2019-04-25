//
//  ReaderViewController.swift
//  Aula3Sample
//
//  Created by Virtual Machine on 22/02/19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import Foundation
import UIKit
let reader = Reader()
protocol CheckoutItemDelegate {
    func selled(name: String)
}
class ReaderViewController: UIViewController, CheckoutDelegate{
    func selled(name: String) {
        delegate?.selled(name: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: CheckoutItemDelegate?
}

extension ReaderViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        let vc = segue.destination as? ItemDetaisViewController
        vc?.delegate = self
        vc?.key = sender as? String
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keys = Array(reader.itens.keys)
        let key = keys[indexPath.row]
        performSegue(withIdentifier: "itemDetail", sender: key)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reader.itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let labelItemName = cell.viewWithTag(22) as? UILabel,
            let labelItemPrice = cell.viewWithTag(44) as? UILabel {
            
            let keys = Array(reader.itens.keys)
            let key = keys[indexPath.row]
            let item = reader.itens[key]
            
            labelItemName.text = key
            labelItemPrice.text = String(item?.price ?? 0)
        }
        
        return cell
    }
}
