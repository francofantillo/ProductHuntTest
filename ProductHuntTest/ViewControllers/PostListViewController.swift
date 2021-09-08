//
//  PostListViewController.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-07.
//

import Foundation
import UIKit

class PostListViewController: ProdcutHuntViewController {
    
    let cellReuseIdentifier = "PostCell"
    var posts = [CommonPost]()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Add CollectionView Data
    
    func appendPosts(posts: [Post]){
        
        var newPosts = [CommonPost]()
        for post in posts {
            let common = CommonPost(post: post)
            newPosts.append(common)
        }
        self.posts.append(contentsOf: newPosts)
    }
    
    func appendVotedPosts(posts: [VotedPost]){
        
        var newPosts = [CommonPost]()
        for post in posts {
            let common = CommonPost(votedPost: post)
            newPosts.append(common)
        }
        self.posts.append(contentsOf: newPosts)
    }
    
    // MARK: - Configure Collection View
    
    func configureCollectionView(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
        let layout = PostCollectionViewFlowLayout(scrollDirection: .vertical)
        collectionView.collectionViewLayout = layout
    }
    
    // Loads the next set of data from api.
    func updateNextSet(){
        fatalError("Override this function in subclass")
        // Override this function in subclass
    }
}

// MARK: - Collection View Delegates

extension PostListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Override this function in subclass
    }
}

extension PostListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PostCell
        let post = posts[indexPath.row]

        cell.postDescription.text = post.tagline
        cell.postName.text = post.name
        cell.voteCount.text = String(post.votesCount)
        if let imageURL = post.thumbnail {
            setImage(cell: cell, url: imageURL)
        }
        cell.postedBy.text = "By: \(post.username)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            updateNextSet()
        }
    }
    
    // MARK: - Load Image Data
    
    private func setImage(cell: PostCell, url: String){
        
        Network.shared.image(url: url) { imageData, error in
            
            guard let data = imageData else {
                if let errorData = error {
                    print("Error downloading image: \(errorData.localizedDescription)")
                }
                return
            }
            DispatchQueue.main.async {
                cell.postThumbnail.image = UIImage(data: data)
            }
        }
    }
    

}
