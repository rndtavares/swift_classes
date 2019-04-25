//
//  PhotosAlbumViewController.swift
//  Aula9
//
//  Created by Ronaldo Tavares da Silva on 25/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class PhotosAlbumViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var album: Album?
    var photos: [Photo] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let album = album else {return}
        
        title = album.title
        
        Photo.get(byAlbum: album.id){ [weak self] photos, error in
            guard let self = self else {return}
            
            self.photos = photos
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else{
            return
        }
        
//        switch identifier {
//        case "goToPhotoDetail":
//            let navVC = segue.destination as!
//        }
    }

}

extension PhotosAlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        
        let photo = photos[indexPath.row]
        
        if let urlString = photo.url, let url = URL(string: urlString) {
            cell.imageViewPhoto.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.size.width / 3
        
        return CGSize(width: size, height: size)
    }
}
