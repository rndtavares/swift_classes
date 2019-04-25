//
//  ResultViewController.swift
//  Aula5
//
//  Created by LOWCOST on 11/03/2019.
//  Copyright © 2019 PS. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var resultString: String?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultSlider: UISlider!
    
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultSlider.value = Float(resultString ?? "0") ?? 0
        resultLabel.text = resultString
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

    @IBAction func changeSlider(_ sender: Any) {
        resultLabel.text = String(resultSlider.value)
        resultSlider.value = Float(Int(resultSlider.value))
    }
    
    
    @IBAction func mySwitchChange(_ sender: Any) {
        myTextView.isEditable = mySwitch.isOn
        myTextView.isSelectable = mySwitch.isOn
    }
}

extension ResultViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
    }
}
