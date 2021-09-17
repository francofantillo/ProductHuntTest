/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An `Operation` subclass used by `AsyncFetcher` to mimic slow network requests for data.
*/

import Foundation

class AsyncFetcherOperation: Operation {
    // MARK: Properties

    /// The `UUID` that the operation is fetching data for.
    let identifier: UUID
    let imageUrl: String

    /// The `DisplayData` that has been fetched by this operation.
    private(set) var fetchedData: Data?

    // MARK: Initialization

    init(identifier: UUID, imageURL: String) {
        self.identifier = identifier
        self.imageUrl = imageURL
    }

    // MARK: Operation overrides
    
    override var isAsynchronous: Bool {
        return true
    }
    
    private var _executing: Bool = false
    override var isExecuting: Bool {
        get {
            return _executing
        }
        set {
            if _executing != newValue {
                willChangeValue(forKey: "isExecuting")
                _executing = newValue
                didChangeValue(forKey: "isExecuting")
            }
        }
    }
    
    private var _finished: Bool = false;
    override var isFinished: Bool {
        get {
            return _finished
        }
        set {
            if _finished != newValue {
                willChangeValue(forKey: "isFinished")
                _finished = newValue
                didChangeValue(forKey: "isFinished")
            }
        }
    }
    
    override func start() {
        // Wait for a second to mimic a slow operation.
        isExecuting = true
        Network.shared.image(url: imageUrl) { [self] imageData, error in
            
            guard let data = imageData else {
                if let errorData = error {
                    print("Error downloading image: \(errorData.localizedDescription)")
                }
                return
            }
            self.fetchedData = data
            isFinished = true
        }
    }
}
