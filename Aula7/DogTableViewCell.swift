//
//  DogTableViewCell.swift
//  Aula7
//
//  Created by Ronaldo Tavares da Silva on 14/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
