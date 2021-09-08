//
//  CommonPost.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-07.
//

import Apollo

 class CommonPost {

    let name: String
    let username: String
    let tagline: String
    let thumbnail: String?
    let votesCount: Int
    let description: String?
    let pictureURLs: [String]
    let users: [CommonUser]
    
    init(post: Post) {
        self.name = post.node.name
        self.username = post.node.user.username
        self.tagline = post.node.tagline
        self.thumbnail = post.node.thumbnail?.url
        self.votesCount = post.node.votesCount
        self.description = post.node.description
        var urls = [String]()
        for url in post.node.media {
            
            urls.append(url.url)
        }
        self.pictureURLs = urls
        
        var addUsers = [CommonUser]()
        let creator = CommonUser(postCreator: post.node.user)
        addUsers.append(creator)
        for maker in post.node.makers {
            let commonUser = CommonUser(maker: maker)
            addUsers.append(commonUser)
        }
        users = addUsers
    }
    
    init(votedPost: VotedPost) {
        self.name = votedPost.node.name
        self.username = votedPost.node.user.username
        self.tagline = votedPost.node.tagline
        self.thumbnail = votedPost.node.thumbnail?.url
        self.votesCount = votedPost.node.votesCount
        self.description = votedPost.node.description
        var urls = [String]()
        for url in votedPost.node.media {
            
            urls.append(url.url)
        }
        self.pictureURLs = urls
        
        var addUsers = [CommonUser]()
        let creator = CommonUser(postCreator: votedPost.node.user)
        addUsers.append(creator)
        for maker in votedPost.node.makers {
            let commonUser = CommonUser(maker: maker)
            addUsers.append(commonUser)
        }
        users = addUsers
    }
}
