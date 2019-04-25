//
//  UserDetailViewController.swift
//  Aula3Sample
//
//  Created by Matheus on 2019-02-21.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

protocol UserDetailDelegate {
    func userSaved(user: User)
}

class UserDetailViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldCC: UITextField!

    var delegate: UserDetailDelegate?
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let user = user else {
            self.user = User()
            return
        }

        textFieldName.text = user.name
        textFieldEmail.text = user.email
        textFieldCC.text = user.cards.first?.number
    }

    @IBAction func submitButton(_ sender: UIButton) {
        
        guard let name = textFieldName.text,
                let email = textFieldEmail.text,
                name.count > 2,
                email.count > 2 else {
            
            return
        }
        
        
        user?.name = name
        user?.email = email
        
        if let cc = textFieldCC.text, cc.count > 10 {
            let card = CreditCard(withid: "1", andNumber: cc)
            user?.cards.append(card)
        }

        guard let user = user else { return }
        delegate?.userSaved(user: user)
        alert(errorMessage: "Usuário salvo com sucesso")
    }
}
