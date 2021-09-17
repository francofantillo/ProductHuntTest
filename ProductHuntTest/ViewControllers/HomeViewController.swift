//
//  ViewController.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-02.
//

import UIKit
import Apollo

class HomeViewController: PostListViewController {

    // Post type is a tyealias of <QUERY>.Data.Post.Edge
    // See the TypeAlias.swift file.
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        getPostData(postCount: 10, cursor: nil)
    }
    
    //MARK: - Load Data
    
    private func getPostData(postCount: Int, cursor: String?){
        
        loadPosts(query: GetPostDataQuery(postCount: 10, cursor: cursor)) { [weak self] selectionSet in
            
            guard let weakSelf = self else { return }
            weakSelf.appendPosts(set: selectionSet)
        }
    }
    
    override func updateNextSet() {
        getPostData(postCount: 10, cursor: currentCursor)
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
    
    private func setCursor(posts: [Post]) -> String? {
        guard let lastPost = posts.last else { return nil }
        let cursor = lastPost.cursor
        return cursor
    }
    
    //MARK: - Override CollectionView Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        showPost(post: post)
    }
}
