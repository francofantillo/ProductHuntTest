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
    
    var currentCursor: String!
    
    //MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        getPostData(postCount: 10, cursor: nil)
    }
    
    //MARK: - Load Data
    
    private func getPostData(postCount: Int, cursor: String?){
        
        Network.shared.apollo.fetch(query: GetPostDataQuery(postCount: postCount, cursor: cursor)) { [self] result in

        switch result {
          case .success(let graphQLResult):
            
            if let postsConnection = graphQLResult.data?.posts {
                let newPosts = postsConnection.edges.compactMap( { $0 } )
                appendPosts(posts: newPosts)
                if let cursor = setCursor(posts: newPosts) {
                    currentCursor = cursor
                }
                collectionView.reloadData()
            }
            
            if let errors = graphQLResult.errors {
                Utility.handleGraphQLError(errors: errors)
            }
            
          case .failure(let error):
            PostAlerts.presentAlertController(titleMsg: "Error", errorMsg: "Unable to retrieve posts with error: \(error)")
          }
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
