//
//  ViewController.swift
//  Aula8
//
//  Created by Ronaldo Tavares da Silva on 15/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var list: [Int: [UIImage]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list[section]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        
        if let section = list[indexPath.section]{
            cell.imageView.image = section[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderCollectionReusableView
            
            header.section = indexPath.section
            header.parentVC = self
            header.delegate = self
                        
            return header
        }else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
            
            return footer
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        
        if indexPath.item == 1 {
            return CGSize(width: Int((width / 3)-2), height: Int((width / 3)-2))
        }else{
            return CGSize(width: Int((width / 3)-2), height: Int((width / 3)-2))

        }
    }
    
}

extension ViewController: HeaderImageDelegate{
    func addImage(_ image: UIImage, toSection section: Int) {
        if list[section] == nil{
            list[section] = []
        }
        
        list[section]?.append(image)
        myCollectionView.reloadData()
    }
}
