//
//  NavViewController.swift
//  Aula3
//
//  Created by Matheus on 2019-02-19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = .red
    }
}
