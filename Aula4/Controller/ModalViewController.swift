//
//  ModalViewController.swift
//  Aula3
//
//  Created by Matheus on 2019-02-19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
