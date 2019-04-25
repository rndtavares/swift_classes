//
//  ViewController.swift
//  Aula9
//
//  Created by Ronaldo Tavares da Silva on 25/03/19.
//  Copyright © 2019 Ronaldo Tavares da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var albums: [Album] = []
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Album.getAlbums{ [weak self] albums, error in
            guard let self = self else {return}
            
            for album in albums {
                print(album.title)
            }
        }
        
        Post.getPosts{[weak self] posts, error in
            guard let self = self else {return}
            
            for post in posts {
                print(post.title)
            }
        }
    }
}
