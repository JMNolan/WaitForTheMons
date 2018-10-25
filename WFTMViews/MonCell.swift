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
    
    @IBOutlet weak var cellImage: UIImageView!
    var mon: Mon!
    
    func setImage(mon: Mon) {
        self.cellImage.image = UIImage(data: mon.image!)
    }
}
