//
//  PackageDetailViewController.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 29/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class PackageDetailViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var players: [Player]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player.openPackage{ [weak self] players, error in
            guard let self = self else {return}
            self.players = players
            self.pageControl.numberOfPages = players.count
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else {return}
        
        _ = segue.destination as! CountryViewController
    }
    
    @IBAction func backHome(_ sender: Any) {
        performSegue(withIdentifier: "backHome", sender: nil)
    }
}


extension PackageDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "packageDetailCell", for: indexPath) as! PackageDetailCollectionViewCell
        
        let player = players?[indexPath.row]
        
        let urlString  = player?.team?.coverImage?.url
        let url = URL(string: urlString ?? "")
        cell.imageViewPlayer.kf.setImage(with: url)
        
        cell.labelPlayerName.text = player?.name
        cell.labelPlayerPosition.text = player?.position
        
        let urlFlagString  = player?.team?.flag?.url
        let urlFlag = URL(string: urlFlagString ?? "")
        cell.imageViewFlag.kf.setImage(with: urlFlag)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.size.width / 1.1
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
