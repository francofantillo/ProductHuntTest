//
//  PostCollectionViewFlowLayout.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-04.
//

import Foundation
import UIKit

class PostCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private var firstSetupDone = false
    
    init(scrollDirection: UICollectionView.ScrollDirection) {
        super.init()
        self.scrollDirection = scrollDirection
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        if !firstSetupDone {
            setup()
            firstSetupDone = true
        }
    }
    
    private func setup() {
        minimumLineSpacing = 16
        let width = UIScreen.main.bounds.width - 34
        itemSize = CGSize(width: width, height: 100)
        sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        collectionView!.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}
