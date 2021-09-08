// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetPostDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetPostData($postCount: Int, $cursor: String) {
      posts(first: $postCount, after: $cursor) {
        __typename
        edges {
          __typename
          cursor
          node {
            __typename
            id
            createdAt
            name
            tagline
            description
            user {
              __typename
              id
              name
              username
              headline
              profileImage
            }
            makers {
              __typename
              id
              name
              username
              headline
              profileImage
            }
            thumbnail {
              __typename
              type
              url
              videoUrl
            }
            media {
              __typename
              type
              url
              videoUrl
            }
            votesCount
          }
        }
      }
    }
    """

  public let operationName: String = "GetPostData"

  public var postCount: Int?
  public var cursor: String?

  public init(postCount: Int? = nil, cursor: String? = nil) {
    self.postCount = postCount
    self.cursor = cursor
  }

  public var variables: GraphQLMap? {
    return ["postCount": postCount, "cursor": cursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("posts", arguments: ["first": GraphQLVariable("postCount"), "after": GraphQLVariable("cursor")], type: .nonNull(.object(Post.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(posts: Post) {
      self.init(unsafeResultMap: ["__typename": "Query", "posts": posts.resultMap])
    }

    /// Look up Posts by various parameters.
    public var posts: Post {
      get {
        return Post(unsafeResultMap: resultMap["posts"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "posts")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PostConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "PostConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PostEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node) {
          self.init(unsafeResultMap: ["__typename": "PostEdge", "cursor": cursor, "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A cursor for use in pagination.
        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        /// The item at the end of the edge.
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Post"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("tagline", type: .nonNull(.scalar(String.self))),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("user", type: .nonNull(.object(User.selections))),
              GraphQLField("makers", type: .nonNull(.list(.nonNull(.object(Maker.selections))))),
              GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
              GraphQLField("media", type: .nonNull(.list(.nonNull(.object(Medium.selections))))),
              GraphQLField("votesCount", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdAt: String, name: String, tagline: String, description: String? = nil, user: User, makers: [Maker], thumbnail: Thumbnail? = nil, media: [Medium], votesCount: Int) {
            self.init(unsafeResultMap: ["__typename": "Post", "id": id, "createdAt": createdAt, "name": name, "tagline": tagline, "description": description, "user": user.resultMap, "makers": makers.map { (value: Maker) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "media": media.map { (value: Medium) -> ResultMap in value.resultMap }, "votesCount": votesCount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// ID of the Post.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// Identifies the date and time when the Post was created.
          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// Name of the Post.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// Tagline of the Post.
          public var tagline: String {
            get {
              return resultMap["tagline"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "tagline")
            }
          }

          /// Description of the Post in plain text.
          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// User who created the Post.
          public var user: User {
            get {
              return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "user")
            }
          }

          /// Users who are marked as makers of the Post.
          public var makers: [Maker] {
            get {
              return (resultMap["makers"] as! [ResultMap]).map { (value: ResultMap) -> Maker in Maker(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Maker) -> ResultMap in value.resultMap }, forKey: "makers")
            }
          }

          /// Thumbnail media object of the Post.
          public var thumbnail: Thumbnail? {
            get {
              return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
            }
          }

          /// Media items for the Post.
          public var media: [Medium] {
            get {
              return (resultMap["media"] as! [ResultMap]).map { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Medium) -> ResultMap in value.resultMap }, forKey: "media")
            }
          }

          /// Number of votes that the object has currently.
          public var votesCount: Int {
            get {
              return resultMap["votesCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "votesCount")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("headline", type: .scalar(String.self)),
                GraphQLField("profileImage", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String, username: String, headline: String? = nil, profileImage: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "username": username, "headline": headline, "profileImage": profileImage])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// ID of the user.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// Name of the user.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Username of the user.
            public var username: String {
              get {
                return resultMap["username"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "username")
              }
            }

            /// Headline text of the user.
            public var headline: String? {
              get {
                return resultMap["headline"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "headline")
              }
            }

            /// Profile image of the user.
            public var profileImage: String? {
              get {
                return resultMap["profileImage"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profileImage")
              }
            }
          }

          public struct Maker: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("headline", type: .scalar(String.self)),
                GraphQLField("profileImage", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String, username: String, headline: String? = nil, profileImage: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "username": username, "headline": headline, "profileImage": profileImage])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// ID of the user.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// Name of the user.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Username of the user.
            public var username: String {
              get {
                return resultMap["username"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "username")
              }
            }

            /// Headline text of the user.
            public var headline: String? {
              get {
                return resultMap["headline"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "headline")
              }
            }

            /// Profile image of the user.
            public var profileImage: String? {
              get {
                return resultMap["profileImage"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profileImage")
              }
            }
          }

          public struct Thumbnail: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("type", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
                GraphQLField("videoUrl", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(type: String, url: String, videoUrl: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "type": type, "url": url, "videoUrl": videoUrl])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Type of media object.
            public var type: String {
              get {
                return resultMap["type"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            /// Public URL for the media object. Incase of videos this URL represents thumbnail generated from video.
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// Video URL of the media object.
            public var videoUrl: String? {
              get {
                return resultMap["videoUrl"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "videoUrl")
              }
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("type", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
                GraphQLField("videoUrl", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(type: String, url: String, videoUrl: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "type": type, "url": url, "videoUrl": videoUrl])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Type of media object.
            public var type: String {
              get {
                return resultMap["type"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            /// Public URL for the media object. Incase of videos this URL represents thumbnail generated from video.
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// Video URL of the media object.
            public var videoUrl: String? {
              get {
                return resultMap["videoUrl"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "videoUrl")
              }
            }
          }
        }
      }
    }
  }
}

public final class GetUserVotedPostQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserVotedPost($userId: ID, $postCount: Int, $cursor: String) {
      user(id: $userId) {
        __typename
        votedPosts(first: $postCount, after: $cursor) {
          __typename
          edges {
            __typename
            cursor
            node {
              __typename
              id
              createdAt
              name
              tagline
              description
              user {
                __typename
                id
                name
                username
                headline
                profileImage
              }
              makers {
                __typename
                id
                name
                username
                headline
                profileImage
              }
              thumbnail {
                __typename
                type
                url
                videoUrl
              }
              media {
                __typename
                type
                url
                videoUrl
              }
              votesCount
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetUserVotedPost"

  public var userId: GraphQLID?
  public var postCount: Int?
  public var cursor: String?

  public init(userId: GraphQLID? = nil, postCount: Int? = nil, cursor: String? = nil) {
    self.userId = userId
    self.postCount = postCount
    self.cursor = cursor
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "postCount": postCount, "cursor": cursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", arguments: ["id": GraphQLVariable("userId")], type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// Look up a User.
    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("votedPosts", arguments: ["first": GraphQLVariable("postCount"), "after": GraphQLVariable("cursor")], type: .nonNull(.object(VotedPost.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(votedPosts: VotedPost) {
        self.init(unsafeResultMap: ["__typename": "User", "votedPosts": votedPosts.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Look up posts that the user has voted for.
      public var votedPosts: VotedPost {
        get {
          return VotedPost(unsafeResultMap: resultMap["votedPosts"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "votedPosts")
        }
      }

      public struct VotedPost: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PostConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge]) {
          self.init(unsafeResultMap: ["__typename": "PostConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge] {
          get {
            return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PostEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .nonNull(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(cursor: String, node: Node) {
            self.init(unsafeResultMap: ["__typename": "PostEdge", "cursor": cursor, "node": node.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A cursor for use in pagination.
          public var cursor: String {
            get {
              return resultMap["cursor"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "cursor")
            }
          }

          /// The item at the end of the edge.
          public var node: Node {
            get {
              return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Post"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("tagline", type: .nonNull(.scalar(String.self))),
                GraphQLField("description", type: .scalar(String.self)),
                GraphQLField("user", type: .nonNull(.object(User.selections))),
                GraphQLField("makers", type: .nonNull(.list(.nonNull(.object(Maker.selections))))),
                GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
                GraphQLField("media", type: .nonNull(.list(.nonNull(.object(Medium.selections))))),
                GraphQLField("votesCount", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, createdAt: String, name: String, tagline: String, description: String? = nil, user: User, makers: [Maker], thumbnail: Thumbnail? = nil, media: [Medium], votesCount: Int) {
              self.init(unsafeResultMap: ["__typename": "Post", "id": id, "createdAt": createdAt, "name": name, "tagline": tagline, "description": description, "user": user.resultMap, "makers": makers.map { (value: Maker) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "media": media.map { (value: Medium) -> ResultMap in value.resultMap }, "votesCount": votesCount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// ID of the Post.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// Identifies the date and time when the Post was created.
            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }

            /// Name of the Post.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Tagline of the Post.
            public var tagline: String {
              get {
                return resultMap["tagline"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "tagline")
              }
            }

            /// Description of the Post in plain text.
            public var description: String? {
              get {
                return resultMap["description"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }

            /// User who created the Post.
            public var user: User {
              get {
                return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "user")
              }
            }

            /// Users who are marked as makers of the Post.
            public var makers: [Maker] {
              get {
                return (resultMap["makers"] as! [ResultMap]).map { (value: ResultMap) -> Maker in Maker(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Maker) -> ResultMap in value.resultMap }, forKey: "makers")
              }
            }

            /// Thumbnail media object of the Post.
            public var thumbnail: Thumbnail? {
              get {
                return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
              }
            }

            /// Media items for the Post.
            public var media: [Medium] {
              get {
                return (resultMap["media"] as! [ResultMap]).map { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Medium) -> ResultMap in value.resultMap }, forKey: "media")
              }
            }

            /// Number of votes that the object has currently.
            public var votesCount: Int {
              get {
                return resultMap["votesCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "votesCount")
              }
            }

            public struct User: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["User"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  GraphQLField("username", type: .nonNull(.scalar(String.self))),
                  GraphQLField("headline", type: .scalar(String.self)),
                  GraphQLField("profileImage", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, name: String, username: String, headline: String? = nil, profileImage: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "username": username, "headline": headline, "profileImage": profileImage])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// ID of the user.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// Name of the user.
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              /// Username of the user.
              public var username: String {
                get {
                  return resultMap["username"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "username")
                }
              }

              /// Headline text of the user.
              public var headline: String? {
                get {
                  return resultMap["headline"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "headline")
                }
              }

              /// Profile image of the user.
              public var profileImage: String? {
                get {
                  return resultMap["profileImage"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "profileImage")
                }
              }
            }

            public struct Maker: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["User"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  GraphQLField("username", type: .nonNull(.scalar(String.self))),
                  GraphQLField("headline", type: .scalar(String.self)),
                  GraphQLField("profileImage", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, name: String, username: String, headline: String? = nil, profileImage: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "username": username, "headline": headline, "profileImage": profileImage])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// ID of the user.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// Name of the user.
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              /// Username of the user.
              public var username: String {
                get {
                  return resultMap["username"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "username")
                }
              }

              /// Headline text of the user.
              public var headline: String? {
                get {
                  return resultMap["headline"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "headline")
                }
              }

              /// Profile image of the user.
              public var profileImage: String? {
                get {
                  return resultMap["profileImage"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "profileImage")
                }
              }
            }

            public struct Thumbnail: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("type", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  GraphQLField("videoUrl", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(type: String, url: String, videoUrl: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Media", "type": type, "url": url, "videoUrl": videoUrl])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Type of media object.
              public var type: String {
                get {
                  return resultMap["type"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "type")
                }
              }

              /// Public URL for the media object. Incase of videos this URL represents thumbnail generated from video.
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              /// Video URL of the media object.
              public var videoUrl: String? {
                get {
                  return resultMap["videoUrl"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "videoUrl")
                }
              }
            }

            public struct Medium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("type", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  GraphQLField("videoUrl", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(type: String, url: String, videoUrl: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Media", "type": type, "url": url, "videoUrl": videoUrl])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Type of media object.
              public var type: String {
                get {
                  return resultMap["type"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "type")
                }
              }

              /// Public URL for the media object. Incase of videos this URL represents thumbnail generated from video.
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              /// Video URL of the media object.
              public var videoUrl: String? {
                get {
                  return resultMap["videoUrl"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "videoUrl")
                }
              }
            }
          }
        }
      }
    }
  }
}
