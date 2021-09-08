//
//  PostViewController.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-04.
//

import Foundation
import UIKit

class PostViewController: ProdcutHuntViewController {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var tagLine: UILabel!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var personCollectionView: UICollectionView!
    @IBOutlet weak var upVotesLabel: UILabel!
    @IBOutlet weak var voteContainer: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var selectedPost: CommonPost
    let personCellReuseIdentifier = "PersonCell"
    let imageCellReuseIdentifier = "ImageCell"

    //MARK: - Initializers
    
    init?(coder: NSCoder, post: CommonPost) {
        self.selectedPost = post
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a post.")
    }
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(post: selectedPost)
        configureImageCollectionView()
        configurePersonCollectionView()
    }
    
    //MARK: - Configure View
    
    private func configure(post: CommonPost){
        
        if let thumb = post.thumbnail {
            thumbnailImage.image = Utility.setThumbnailImage(thumbnailImageURL: thumb)
        }
        postTitle.text = post.name
        tagLine.text = post.tagline
        upVotesLabel.text = String(post.votesCount) + " UpVotes"
        voteContainer.layer.cornerRadius = 10
        descriptionLabel.sizeToFit()
        descriptionLabel.text = post.description
    }
    
    //MARK: - Configure CollectionViews
    
    private func configurePersonCollectionView(){
        
        personCollectionView.delegate = self
        personCollectionView.dataSource = self
        personCollectionView.register(UINib.init(nibName: personCellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: personCellReuseIdentifier)
        let layout = PersonCollectionViewFlowLayout()
        personCollectionView.collectionViewLayout = layout
    }
    
    private func configureImageCollectionView(){
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(UINib.init(nibName: imageCellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: imageCellReuseIdentifier)
        let layout = ImageCollectionViewFlowLayout()
        imageCollectionView.collectionViewLayout = layout
    }
    
    //MARK: - Navigation
    
    func showUserProfile(user: CommonUser) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "UserViewController", creator: { coder in
            return UserViewController(coder: coder, user: user)
        }) else {
            fatalError("Failed to load PostViewController from storyboard.")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
}

    //MARK: - CollectionsView Delegates

extension PostViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard collectionView == personCollectionView else { return }
        let user = selectedPost.users[indexPath.row]
        showUserProfile(user: user)
    }
    
}

extension PostViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
            case imageCollectionView:
                return selectedPost.pictureURLs.count
            case personCollectionView:
                return selectedPost.users.count
            default:
                fatalError("Need to match with a collection view.")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            case imageCollectionView:
                return configureImageCell(collectionView: collectionView, indexPath: indexPath)
            case personCollectionView:
                return configurePersonCell(collectionView: collectionView, indexPath: indexPath)
            default:
                fatalError("Need to match with a collection view.")
        }
    }
    
    private func configurePersonCell(collectionView: UICollectionView ,indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: personCellReuseIdentifier, for: indexPath) as! PersonCell
        let user = selectedPost.users[indexPath.row]
        if let imageURL = user.profileImage {
            setImage(cell: cell, url: imageURL)
        }
        cell.nameLabel.text = user.name
        
        if user.isMaker {
            cell.typeContainer.backgroundColor = #colorLiteral(red: 0.4117647059, green: 1, blue: 0.6470588235, alpha: 1)
            cell.typeLabel.text = "M"
        } else {
            cell.typeContainer.backgroundColor = UIColor.black
            cell.typeLabel.text = "H"
        }
        return cell
    }
    
    private func configureImageCell(collectionView: UICollectionView ,indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellReuseIdentifier, for: indexPath) as! ImageCell
        let imageURL = selectedPost.pictureURLs[indexPath.row]
        setImage(cell: cell, url: imageURL)
        return cell
    }
    
    private func setImage(cell: UICollectionViewCell, url: String){
        
        Network.shared.image(url: url) { imageData, error in
            
            guard let data = imageData else {
                if let errorData = error {
                    print("Error downloading image: \(errorData.localizedDescription)")
                }
                return
            }
            DispatchQueue.main.async {
                
                if let imageCell = cell as? ImageCell {
                    imageCell.image.image = UIImage(data: data)
                }
                if let personCell = cell as? PersonCell {
                    personCell.profilePic.image = UIImage(data: data)
                }
            }
        }
    }
}
