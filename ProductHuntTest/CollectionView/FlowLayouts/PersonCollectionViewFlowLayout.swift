//
//  PersonCollectionViewFlowLayout.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-04.
//

import Foundation
import UIKit

class PersonCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private var firstSetupDone = false
    
    override func prepare() {
        super.prepare()
        if !firstSetupDone {
            setup()
            firstSetupDone = true
        }
    }
    
    private func setup() {
        scrollDirection = .horizontal
        minimumLineSpacing = 2
        let width = 250
        itemSize = CGSize(width: width, height: 60)
        sectionInset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
        collectionView!.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}
