//
//  AlbumsViewController.swift
//  Aula9
//
//  Created by Ronaldo Tavares da Silva on 25/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {

    var albums: [Album] = []
    
    @IBOutlet weak var albumTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Album.getAlbums{ [weak self] albums, error in
            guard let self = self else {return}
            
            self.albums = albums
            
            self.albumTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else {return}
        
        let photoVC = segue.destination as! PhotosAlbumViewController
        
        photoVC.album = sender as? Album
    }
    

}

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
        
        let album = albums[indexPath.row]
        cell.albumLabel.text = album.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "goToAlbum", sender: albums[indexPath.row])
    }
}
