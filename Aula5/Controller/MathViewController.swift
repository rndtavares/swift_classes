//
//  MathViewController.swift
//  Aula5
//
//  Created by LOWCOST on 11/03/2019.
//  Copyright © 2019 PS. All rights reserved.
//

import UIKit

enum Operation:Int{
    case ADD, SUB, MUL, DIV
}

class MathViewController: UIViewController {
    
    @IBOutlet weak var number1TextField: UITextField!
    
    @IBOutlet weak var number2TextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var selectedOperation: Operation = .ADD
    
    @IBAction func segmentClick(_ sender: Any) {
        selectedOperation = Operation(rawValue: segmentedControl.selectedSegmentIndex) ?? Operation.ADD
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submit(_ sender: Any) {
        let string1 = number1TextField.text ?? ""
        let string2 = number2TextField.text ?? ""
        
        guard let number1 = Double(string1),
              let number2 = Double(string2)
            else{
                print("Náo foi possivel transformar a string em numero")
                return
        }

        var result: Double = 0
        
        switch selectedOperation {
        case .ADD:
            result = number1 + number2
        case .SUB:
            result = number1 - number2
        case .MUL:
            result = number1 * number2
        case .DIV:
            result = number1 / number2
        }
        
        resultLabel.text = String(result)

        print(string1)
        print(string2)
    }
    
    
    @IBAction func avancar(_ sender:Any) {
        performSegue(withIdentifier: "showNext", sender: resultLabel.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == "showNext"{
            let nextVC = segue.destination as? ResultViewController
            nextVC?.resultString = sender as? String
        }
    }
    

    
}
