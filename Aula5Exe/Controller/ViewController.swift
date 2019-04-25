//
//  ViewController.swift
//  Aula5Exe
//
//  Created by LOWCOST on 11/03/2019.
//  Copyright © 2019 PS. All rights reserved.
//

import UIKit

enum Time : Int{
    case Corinthians, Palmeiras, SaoPaulo, Santos
}

class ViewController: UIViewController {

    @IBOutlet weak var timeSegment: UISegmentedControl!
    var time : Time = .Corinthians
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func timeChange(_ sender: Any) {
        time = Time(rawValue: timeSegment.selectedSegmentIndex) ?? Time.Corinthians
    }
    @IBAction func confirmar(_ sender: Any) {
        performSegue(withIdentifier: "showTime", sender: time)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == "showTime"{
            let nextVC = segue.destination as? TimeViewController
            nextVC?.time = (sender as? Time)!
        }
    }
}

