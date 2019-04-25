//
//  SegueViewController.swift
//  Aula3
//
//  Created by Matheus on 2019-02-19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {

    @IBOutlet weak var myButtonVar: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func button1Click(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: nil)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print(segue.identifier)
        // Will print the name of the segue that you called
        
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case "mySegue":
            let viewController = segue.destination
            viewController.view.backgroundColor = .red
            print("do the code to send data to the next viewcontroller")
        case "mySegue2":
            print("my segue called direct of the button")
        default:
            print("this segue wasn't found")
        }
    }
}
