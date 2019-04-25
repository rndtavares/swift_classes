//
//  HistoryViewController.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-20.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, CheckoutItemDelegate {
    func selled(name: String) {
        do{
            print(name)
            let history = try History(name: name)
            history.status = PurchaseStatus.done
            myOrders.append(history)
            tableView.reloadData()
        }catch{
            print(error)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var myOrders: [History] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "showCheckout":
            let vc = segue.destination as? ReaderViewController
            vc?.delegate = self
        case "showOrder":
            let vc = segue.destination as? UIViewController
        case "showEditUser":
            let vc = segue.destination as? UIViewController
        
        default:
            break
        }
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let labelOrderThings = cell.viewWithTag(22) as? UILabel,
            let labelOrderStatus = cell.viewWithTag(44) as? UILabel {
            
            let history = myOrders[indexPath.row]
            
            labelOrderThings.text = history.name // Aqui vai nome do pedido, data..
            labelOrderStatus.text = history.status.rawValue // Aqui vai o status do pedido
        }

        return cell
    }
}
