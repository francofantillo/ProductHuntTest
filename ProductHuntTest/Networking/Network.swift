//
//  Network.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-03.
//

import Foundation
import Apollo

enum NetworkManagerError: Error {
  case badResponse(URLResponse?)
  case badData
  case badLocalUrl
}

private let token = "Pmi_WfEQ_Ag4tNWbQtcF_qMl3mOlB3YKXuMp545JmUg"
private let host = "https://api.producthunt.com/v2/api/graphql"

class Network {
    
    static let shared = Network()
    
    //private var images = NSCache<NSString, NSData>()
    let session: URLSession
    
    init() {
      let config = URLSessionConfiguration.default
      session = URLSession(configuration: config)
    }
    
    private(set) lazy var apollo: ApolloClient = {

        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["Authorization": "Bearer \(token)"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        
        let url = URL(string: host)!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
    
    func image(url: String, completion: @escaping (Data?, Error?) -> (Void)) {
      let url = URL(string: url)!
      download(imageURL: url, completion: completion)
    }
    
    private func download(imageURL: URL, completion: @escaping (Data?, Error?) -> (Void)) {
        
        let task = session.downloadTask(with: imageURL) { localUrl, response, error in
          if let error = error {
            completion(nil, error)
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            completion(nil, NetworkManagerError.badResponse(response))
            return
          }
          
          guard let localUrl = localUrl else {
            completion(nil, NetworkManagerError.badLocalUrl)
            return
          }
          
          do {
            let data = try Data(contentsOf: localUrl)
            completion(data, nil)
          } catch let error {
            completion(nil, error)
          }
        }
        
        task.resume()
      }
}

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        
        print("request :\(request)")
        print("response :\(String(describing: response))")
        
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
