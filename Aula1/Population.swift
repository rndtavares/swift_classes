//
//  Population.swift
//  Aula1
//
//  Created by Matheus on 2019-02-13.
//  Copyright © 2019 Mocka. All rights reserved.
//

import UIKit

struct Population {

    var men = 0
    var women = 0
    
    func getPercentage() -> (men: Int, women: Int) {
        let total = men + women

        return (men: (men / total) * 100, women: (women / total) * 100)
    }
}
