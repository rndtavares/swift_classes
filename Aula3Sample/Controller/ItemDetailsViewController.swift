//
//  ItemDetailsViewController.swift
//  Aula3Sample
//
//  Created by Virtual Machine on 22/02/19.
//  Copyright © 2019 Mocka. All rights reserved.
//

import Foundation
import UIKit

protocol CheckoutDelegate {
    func selled(name: String)
}
class ItemDetaisViewController: UIViewController{
    
    var key : String?
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = key
        let item = reader.itens[String(key ?? "")]
        labelValor.text = String(item?.price ?? 0)
        labelCount.text = String(item?.count ?? 0)
    }
    
    var delegate: CheckoutDelegate?
    
    @IBAction func buy(_ sender: Any) {
        // aqui vai a função de compra
        do{
            try reader.vend(itemName: key ?? "")
            delegate?.selled(name: key ?? "")
        }catch ReaderError.ivalidNameError{
            print("invalid selection")
        }catch ReaderError.outOfStock{
            print("out of stock")
        }catch{
            print("another type of error")
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
