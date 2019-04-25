//
//  PlayerDetailViewController.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 29/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController {

    var team: Team?
    var player: Player?
    
    @IBOutlet weak var imageViewTeam: UIImageView!
    @IBOutlet weak var labelPlayerName: UILabel!
    @IBOutlet weak var labelPlayerPosition: UILabel!
    @IBOutlet weak var imageViewFlag: UIImageView!
    @IBOutlet weak var labelBirthday: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelClub: UILabel!
    @IBOutlet weak var labelPosition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString  = team?.coverImage?.url ?? ""
        let url = URL(string: urlString)
        imageViewTeam.kf.setImage(with: url)
        
        labelPlayerName.text = player?.name
        labelPlayerPosition.text = player?.position
        
        let urlFlagString  = team?.flag?.url ?? ""
        let urlFlag = URL(string: urlFlagString)
        imageViewFlag.kf.setImage(with: urlFlag)
        
        labelBirthday.text = player?.birthday
        labelAge.text = String(player?.age ?? 0)
        labelClub.text = player?.club
        labelPosition.text = player?.position
    }
}
