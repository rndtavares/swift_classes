//
//  Extensions.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-21.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

extension UIViewController {

    func alert(errorMessage: String) {
        let alert = UIAlertController(title: "Ops", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
}
