//
//  Movies.swift
//  MovieApp
//
//  Created by Mark van Winden on 15-07-16.
//  Copyright © 2016 Mark van Winden. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movies: NSManagedObject {
    
    func setDataImg(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getDataImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
