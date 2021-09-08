//
//  PersonCell.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-04.
//

import Foundation
import UIKit


class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var typeContainer: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    private func configure(){
        DispatchQueue.main.async { [self] in
            self.typeContainer.layer.cornerRadius = 12.5
            self.typeContainer.layer.borderWidth = 1
            self.typeContainer.layer.borderColor = UIColor.white.cgColor
            self.typeContainer.layer.masksToBounds = true
            self.profilePic.layer.cornerRadius = self.profilePic.bounds.height/2
            self.profilePic.layer.masksToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}
