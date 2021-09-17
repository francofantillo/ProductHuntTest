//
//  PostListViewController.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-07.
//

import Foundation
import UIKit
import Apollo

class PostListViewController: ProdcutHuntViewController {
    
    let cellReuseIdentifier = "PostCell"
    
    /// An `AsyncFetcher` that is used to asynchronously fetch `DisplayData` objects.
    private let asyncFetcher = AsyncFetcher()
    var posts = [CommonPost]()
    var currentCursor: String?

    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Add CollectionView Data
    
    func appendPosts(set: GetPostDataQuery.Data){
        
        let posts = set.posts.edges.compactMap( { $0 } )
        
        var newPosts = [CommonPost]()
        for post in posts {
            let common = CommonPost(post: post)
            newPosts.append(common)
        }
        
        self.posts.append(contentsOf: newPosts)
        collectionView.reloadData()

        guard let lastPost = posts.last else { return }
        currentCursor = lastPost.cursor
    }
    
    func appendVotedPosts(set: GetUserVotedPostQuery.Data){
        
        guard let user = set.user else { return }
        let posts = user.votedPosts.edges.compactMap( { $0 } )
        
        var newPosts = [CommonPost]()
        for post in posts {
            let common = CommonPost(votedPost: post)
            newPosts.append(common)
        }
        self.posts.append(contentsOf: newPosts)
        collectionView.reloadData()
        
        guard let lastPost = posts.last else { return }
        currentCursor = lastPost.cursor
    }
    
    // MARK: - Configure Collection View
    
    func configureCollectionView(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        collectionView.register(UINib.init(nibName: cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
        let layout = PostCollectionViewFlowLayout(scrollDirection: .vertical)
        collectionView.collectionViewLayout = layout
    }
    
    // Loads the next set of data from api.
    func updateNextSet(){
        fatalError("Override this function in subclass")
        // Override this function in subclass
    }
    
    func loadPosts<T: GraphQLQuery>(query: T, handler: @escaping (T.Data)-> Void){
        
        Network.shared.apollo.fetch(query: query) {result in
            
        switch result {
          case .success(let graphQLResult):
            
            if let newPosts = graphQLResult.data  {
                handler(newPosts)
            }
            
            if let errors = graphQLResult.errors {
                Utility.handleGraphQLError(errors: errors)
            }
            
          case .failure(let error):
            PostAlerts.presentAlertController(titleMsg: "Error", errorMsg: "Unable to retrieve posts with error: \(error)")
          }
        }
    }
}

// MARK: - Collection View Delegates

extension PostListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Override this function in subclass
    }
}

extension PostListViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            let post = posts[indexPath.row]
            if let imageURL = post.thumbnail {
                asyncFetcher.fetchAsync(post.id, imageURL: imageURL)
            }
            
        }
    }
}

extension PostListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PostCell
//        cell.postThumbnail.stopAnimating()
//        cell.postThumbnail.image = nil
//        cell.postThumbnail.animationImages = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PostCell
        let post = posts[indexPath.row]

        cell.postDescription.text = post.tagline
        cell.postName.text = post.name
        cell.voteCount.text = String(post.votesCount)
        cell.postedBy.text = "By: \(post.username)"
        
        
        // Check if the `asyncFetcher` has already fetched data for the specified identifier.
        let id = post.id
        cell.id = id
        
        if let fetchedData = asyncFetcher.fetchedData(for: id) {
            // The data has already been fetched and cached; use it to configure the cell.
            self.setImage(cell: cell, data: fetchedData as Data)
        } else {
            // There is no data available; clear the cell until we've fetched data.
            // Ask the `asyncFetcher` to fetch data for the specified identifier.
            if let imageURL = post.thumbnail {
                asyncFetcher.fetchAsync(id, imageURL: imageURL) { [weak self] fetchedData in
                    DispatchQueue.main.async {
                        /*
                         The `asyncFetcher` has fetched data for the identifier. Before
                         updating the cell, check if it has been recycled by the
                         collection view to represent other data.
                         */
                        guard cell.id == id else { return }
                        guard let data = fetchedData else { return }
                        // Configure the cell with the fetched image.
                        self!.setImage(cell: cell, data: data)
                    }
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            updateNextSet()
        }
    }
    
    // MARK: - Load Image Data
    
    private func setImage(cell: PostCell, data: Data){

//        if Utility.isAnimatedImage(data) {
//            guard let images = Utility.fromGif(gifData: data) else { return }
//            cell.postThumbnail.animationImages = images
//            cell.postThumbnail.animationDuration = 1
//            cell.postThumbnail.startAnimating()
//
//        } else {
            cell.postThumbnail.image = UIImage(data: data)
//        }
    }
}
