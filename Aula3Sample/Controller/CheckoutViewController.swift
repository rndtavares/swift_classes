//
//  CheckoutViewController.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-20.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

protocol CheckoutFinishedProtocol {
    func successPurchase(_ purchase: Purchase)
    func errorPurchase(_ purchase: Purchase)
}

class CheckoutViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var user: User?
    var products = [Product(withid: "1", andName: "Tenis"), Product(withid: "2", andName: "Camiseta"), Product(withid: "3", andName: "Boné")]

    var delegate: CheckoutFinishedProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()


        let meia = Product(withid: "4", andName: "Meia")
        meia.stock = 10
        products.append(meia)

        products = Array(Set(products))
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension CheckoutViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let product = products[indexPath.row]

        if let labelOrderThings = cell.viewWithTag(22) as? UILabel {
            labelOrderThings.text = product.name
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]

        do {
            let purchase = try Purchase(user: user, date: Date(), product: product, card: user?.cards.first)

            purchase.finishPurchase { [weak self] myPurchase, success in
                if success {
                    self?.delegate?.successPurchase(purchase)
                    self?.alert(errorMessage: "Produto comprado com sucesso")
                } else {
                    self?.delegate?.errorPurchase(purchase)
                    self?.alert(errorMessage: "Ocorreu um erro na compra")
                }
            }
        } catch PurchaseError.noProductSelected {
            alert(errorMessage:"Nenhum produto selecionado.")
        } catch PurchaseError.noCreditCard {
            alert(errorMessage:"Usuário sem cartão.")
        } catch PurchaseError.noUserSelected {
            alert(errorMessage:"Nenhum user logado.")
        } catch {
            alert(errorMessage:"Unexpected error: \(error).")
        }
    }

    
}
