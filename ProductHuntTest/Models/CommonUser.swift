//
//  CommonUser.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-03.
//

import Foundation
import Apollo


class CommonUser {
    
    let id: String
    let name: String
    let username: String
    let headline: String!
    let profileImage: String!
    let isMaker: Bool
    
    init(postCreator: User) {
        self.id = postCreator.id
        self.name = postCreator.name
        self.username = postCreator.username
        self.headline = postCreator.headline
        self.profileImage = postCreator.profileImage
        isMaker = false
    }
    
    init(maker: Maker) {
        self.id = maker.id
        self.name = maker.name
        self.username = maker.username
        self.headline = maker.headline
        self.profileImage = maker.profileImage
        isMaker = true
    }
    
    init(postCreator: VotedUser) {
        self.id = postCreator.id
        self.name = postCreator.name
        self.username = postCreator.username
        self.headline = postCreator.headline
        self.profileImage = postCreator.profileImage
        isMaker = false
    }
    
    init(maker: VotedMaker) {
        self.id = maker.id
        self.name = maker.name
        self.username = maker.username
        self.headline = maker.headline
        self.profileImage = maker.profileImage
        isMaker = true
    }
}
