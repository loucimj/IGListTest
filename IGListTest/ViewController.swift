//
//  ViewController.swift
//  IGListTest
//
//  Created by Javier Loucim on 8/1/17.
//  Copyright © 2017 Qeeptouch. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewContainer: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var data = Array<String>()
    
    var data1:Array<String> = ["uno","dos","tres","cuatro"]
    var data2:Array<String> = ["cinco","seis","siete"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.white
        
        collectionViewContainer.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self

        leftView.isUserInteractionEnabled = true
        rightView.isUserInteractionEnabled = true
        leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(left)))
        rightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(right)))
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = collectionViewContainer.bounds
    }
    
    func left() {
        data = data1
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func right() {
        data = data2
        adapter.performUpdates(animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is String:   return MessageSectionController()
//        case is GridItem: return GridSectionController()
        default:          return MessageSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
    
}
