//
//  PackageViewController.swift
//  FinalAPP
//
//  Created by Ronaldo Tavares da Silva on 29/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class PackageViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var packagesCount: Int = 0{
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        packagesCount = UserDefaults.standard.integer(forKey: "packageCount")
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else {return}
        
        _ = segue.destination as! PackageDetailViewController
        
        packagesCount = packagesCount-1
        UserDefaults.standard.set(packagesCount, forKey: "packageCount")
    }
    
}

extension PackageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return packagesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "packageCell", for: indexPath) as! PackageCollectionViewCell
        
        let urlString  = "https://ui.assets-asda.com/dm/asdagroceries/T_8018190084986_T1?defaultImage=asdagroceries/noImageAvailable&resMode=sharp2&id=QTtSn1&fmt=jpg&fit=constrain,1&wid=280&hei=280"
        let url = URL(string: urlString)
        cell.imageViewPackage.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.size.width / 2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPackageDetail", sender: indexPath.row)
    }
}
