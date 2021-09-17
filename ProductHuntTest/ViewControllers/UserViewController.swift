//
//  UserViewController.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-07.
//

import Foundation
import UIKit

class UserViewController: PostListViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userContainer: UIView!
    
    let selectedUser: CommonUser
    
    //MARK: - Initializers
    
    init?(coder: NSCoder, user: CommonUser) {
        selectedUser = user
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a post.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureCollectionView()
        showUserData()
        loadPosts(postCount: 10, cursor: nil, user: selectedUser)
    }
    
    //MARK: - Configure Views
    
    private func configure(){
        userContainer.layer.cornerRadius = 10
        
        // Delaying this allows the corner radius to draw properly
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            let height = self!.profileImage.bounds.height
            self!.profileImage.layer.cornerRadius = height/2
        }
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.white.cgColor
    }
    
    private func showUserData(){
        nameLabel.text = selectedUser.name
        userNameLabel.text = "@" + selectedUser.username
        profileImage.image = Utility.setThumbnailImage(thumbnailImageURL: selectedUser.profileImage!)
    }
    
    //MARK: - Load Data
    
    private func loadPosts(postCount: Int, cursor: String?, user: CommonUser){
        
        loadPosts(query: GetUserVotedPostQuery(userId: user.id, postCount: postCount, cursor: currentCursor)) { [weak self] selectionSet in
            
            guard let weakSelf = self else { return }
            weakSelf.appendVotedPosts(set: selectionSet)
        }
    }
    
    //MARK: - Load Next Data
    
    override func updateNextSet() {
        if posts.count % 10 == 0 {
            loadPosts(postCount: 10, cursor: currentCursor, user: selectedUser)
        }
    }
    
    //MARK: - Navigation

    func showPost(post: CommonPost) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "PostViewController", creator: { coder in
            return PostViewController(coder: coder, post: post)
        }) else {
            fatalError("Failed to load PostViewController from storyboard.")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Collection View Delegate Overrides
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        showPost(post: post)
    }
}
