//
//  TypeAlias.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-03.
//

import Foundation
import Apollo

typealias Post = GetPostDataQuery.Data.Post.Edge
typealias User = GetPostDataQuery.Data.Post.Edge.Node.User
typealias Maker = GetPostDataQuery.Data.Post.Edge.Node.Maker
typealias VotedPost = GetUserVotedPostQuery.Data.User.VotedPost.Edge
typealias VotedUser = GetUserVotedPostQuery.Data.User.VotedPost.Edge.Node.User
typealias VotedMaker = GetUserVotedPostQuery.Data.User.VotedPost.Edge.Node.Maker
