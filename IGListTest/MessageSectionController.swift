//
//  MessageSectionController.swift
//  IGListTest
//
//  Created by Javier Loucim on 8/3/17.
//  Copyright © 2017 Qeeptouch. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class MessageSectionController: ListSectionController {

    var data:String = ""
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext!.containerSize.width
        let height = LabelCollectionViewCell.calculateHeight()
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: "LabelCollectionViewCell", bundle: Bundle.main, for: self, at: index) as! LabelCollectionViewCell
        cell.configure(with: data)
        cell.backgroundColor = UIColor.gray
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.data = object as! String
    }
    
    override func didSelectItem(at index: Int) {
//        expanded = !expanded
//        UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       usingSpringWithDamping: 0.4,
//                       initialSpringVelocity: 0.6,
//                       options: [],
//                       animations: {
//                        self.collectionContext?.invalidateLayout(for: self)
//        })
    }
    
}
