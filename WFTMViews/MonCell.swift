//
//  MonCell.swift
//  Wait For The Mons
//
//  Created by John Nolan on 8/16/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class MonCell: UICollectionViewCell {
    
    var cellImage: UIImageView!
    var mon: Mon!
    
    func setImage(mon: Mon) {
        print("This is the image for this cell: \(String(describing: mon.image))")
        self.cellImage.image = UIImage(data: mon.image!)
    }
}
