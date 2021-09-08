//
//  PendingCell.swift
//  ModenaRainMaker
//
//  Created by Franco on 2021-07-29.
//  Copyright © 2021 Espressif. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {

    @IBOutlet weak var postThumbnail: UIImageView!
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var voteContainer: UIView!
    @IBOutlet weak var postedBy: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    override func layoutSubviews() {
        configure()
    }
    
    private func configure(){
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.isUserInteractionEnabled = false
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        layer.shadowColor = #colorLiteral(red: 0.831372549, green: 0.3215686275, blue: 0.1803921569, alpha: 1)
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
        voteContainer.layer.cornerRadius = 10
    }
}
