//
//  ProductHuntViewController.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-04.
//

import Foundation
import UIKit

class ProdcutHuntViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavIcon()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = UIBarStyle.default
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.831372549, green: 0.3215686275, blue: 0.1803921569, alpha: 1)
    }
 
    private func setNavIcon(){
        
         let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
         let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
         imageView.contentMode = .scaleAspectFit
         let image = UIImage(named: "product-hunt-logo-orange.png")
         imageView.image = image
         logoContainer.addSubview(imageView)
         navigationItem.titleView = logoContainer
    }
}
