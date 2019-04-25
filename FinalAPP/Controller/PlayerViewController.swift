//
//  PlayerViewController.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 28/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var teamIndex: Int = 0
    var teams: [Team] = []
    var players: [Player] = [] {
        didSet {
            collectionViewTeam.reloadData()
        }
    }


    @IBOutlet weak var imageViewNextTeam: UIImageView!
    @IBOutlet weak var imageViewPreviousTeam: UIImageView!
    @IBOutlet weak var imageViewTeam: UIImageView!
    @IBOutlet weak var buttonNextTeam: UIButton!
    @IBOutlet weak var buttonPreviousTeam: UIButton!
    @IBOutlet weak var labelTeam: UILabel!
    @IBOutlet weak var collectionViewTeam: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTeamLabels(teamIndex: teamIndex)
        
        loadPlayers(teamIndex: teamIndex)
    }
    
    func loadPlayers(teamIndex: Int){
        let teamId = teams[teamIndex].objectId
        players = []
        Player.getPlayersBy(teamId: teamId){ [weak self] players, error in
            guard let self = self else {return}
            self.players = players
        }
    }
    
    func setTeamLabels(teamIndex: Int){
        labelTeam.text = teams[teamIndex].name
        let urlString  = teams[teamIndex].flag?.url ?? ""
        let url = URL(string: urlString)
        imageViewTeam.kf.setImage(with: url)
        
        if teamIndex > 0{
            buttonPreviousTeam.setTitle(teams[teamIndex-1].name, for: UIControl.State.normal)
            let urlStringPreviousTeam  = teams[teamIndex-1].flag?.url ?? ""
            let urlPreviousTeam = URL(string: urlStringPreviousTeam)
            imageViewPreviousTeam.kf.setImage(with: urlPreviousTeam)
        }else{
            buttonPreviousTeam.setTitle(" ", for: UIControl.State.normal)
            imageViewPreviousTeam.kf.setImage(with: nil)
        }
        
        if teamIndex < (teams.count-1){
            buttonNextTeam.setTitle(teams[teamIndex+1].name, for: UIControl.State.normal)
            let urlStringNextTeam  = teams[teamIndex+1].flag?.url ?? ""
            let urlNextTeam = URL(string: urlStringNextTeam)
            imageViewNextTeam.kf.setImage(with: urlNextTeam)
        }else{
            buttonNextTeam.setTitle(" ", for: UIControl.State.normal)
            imageViewNextTeam.kf.setImage(with: nil)
        }
    }
    
    
    @IBAction func buttonPreviousTeam(_ sender: Any) {
        if teamIndex > 0{
            teamIndex = teamIndex-1
        }else{
            teamIndex = 0
        }
        setTeamLabels(teamIndex: teamIndex)
        loadPlayers(teamIndex: teamIndex)
    }
    
    @IBAction func buttonNextTeam(_ sender: Any) {
        if teamIndex < (teams.count-1){
            teamIndex = teamIndex+1
        }else{
            teamIndex = teams.count-1
        }
        setTeamLabels(teamIndex: teamIndex)
        loadPlayers(teamIndex: teamIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else {return}
        
        let playerDetailsVC = segue.destination as! PlayerDetailViewController
        
        playerDetailsVC.team = teams[teamIndex]
        playerDetailsVC.player = players[sender as? Int ?? 0]
        
    }
}

extension PlayerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! PlayerCollectionViewCell
        
        let player = players[indexPath.row]

//        if player.images.count > 0{
//            let urlString = player.images[0]
//            let url = URL(string: urlString)
//            cell.imageViewPlayer.kf.setImage(with: url)
//        }
        let urlString  = "https://cdn4.iconfinder.com/data/icons/political-elections/50/48-512.png"
        let url = URL(string: urlString)
        cell.imageViewPlayer.kf.setImage(with: url)
        cell.labelPlayer.text = player.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.size.width / 3
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPlayerDetail", sender: indexPath.row)
    }
    
}
