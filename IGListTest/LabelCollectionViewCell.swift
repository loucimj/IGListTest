//
//  LabelCollectionViewCell.swift
//  IGListTest
//
//  Created by Javier Loucim on 8/3/17.
//  Copyright © 2017 Qeeptouch. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell, NibLoadable {

    @IBOutlet weak var titleLabel: UILabel!
    
    class func calculateHeight() -> CGFloat {
        return 50
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with title:String) {
        titleLabel.text = title
    }
    
}
