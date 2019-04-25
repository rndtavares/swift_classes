//
//  DetailsViewController.swift
//  Aula5Exe
//
//  Created by Virtual Machine on 13/03/19.
//  Copyright © 2019 PS. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var time : Time = .Corinthians

    @IBOutlet weak var switchMundial: UISwitch!
    @IBOutlet weak var labelMundial: UILabel!
    @IBOutlet weak var slideTorcida: UISlider!
    @IBOutlet weak var labelTorcida: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch time {
        case .Corinthians:
            switchMundial.isOn = true
            labelMundial.text = "2000, 2012"
            slideTorcida.value = 27_300_000
            labelTorcida.text = "27.300.000"
        case .Palmeiras:
            switchMundial.isOn = false
            labelMundial.text = "Jamais terá"
            slideTorcida.value = 10_600_000
            labelTorcida.text = "10.600.000"
        case .SaoPaulo:
            switchMundial.isOn = true
            labelMundial.text = "1992, 1993, 2005"
            slideTorcida.value = 13_600_000
            labelTorcida.text = "13.600.000"
        case .Santos:
            switchMundial.isOn = true
            labelMundial.text = "1962, 1963"
            slideTorcida.value = 4_800_000
            labelTorcida.text = "4.800.000"
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
