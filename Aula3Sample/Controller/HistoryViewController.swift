//
//  HistoryViewController.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-20.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var myOrders: [Purchase] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }

        switch identifier {
        case "showCheckout":
            let navVC = segue.destination as? UINavigationController
            let vc = navVC?.viewControllers.first as? CheckoutViewController
            vc?.user = user
            vc?.delegate = self
        case "showOrder":
            let vc = segue.destination as? OrderDetailViewController
            vc?.order = sender as? Purchase
        case "showEditUser":
            let vc = segue.destination as? UserDetailViewController
            vc?.delegate = self
            vc?.user = user
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
            
            labelOrderThings.text = myOrders[indexPath.row].product.name
            labelOrderStatus.text = myOrders[indexPath.row].status.rawValue
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myOrder = myOrders[indexPath.row]
        performSegue(withIdentifier: "showOrder", sender: myOrder)
    }
}

extension HistoryViewController: CheckoutFinishedProtocol {
    func successPurchase(_ purchase: Purchase) {
        myOrders.append(purchase)
    }
    
    func errorPurchase(_ purchase: Purchase) {
        myOrders.append(purchase)
    }
}

extension HistoryViewController: UserDetailDelegate {
    func userSaved(user: User) {
        self.user = user
    }
}
