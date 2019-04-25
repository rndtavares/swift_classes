//
//  OrderDetailViewController.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-21.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!

    var order: Purchase?

    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.text = order?.status.rawValue
    }

}
