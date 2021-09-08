//
//  ImageCollectionViewFlowLayout.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-04.
//

import Foundation
import UIKit

class ImageCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
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
        minimumLineSpacing = 0
        let width = UIScreen.main.bounds.width - 34
        itemSize = CGSize(width: width, height: 366)
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView!.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}
