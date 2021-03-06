//
//  MiscUtilityExtensions.swift
//  ProductHuntTest
//
//  Created by Franco on 2021-09-03.
//

import Foundation
import UIKit
import Apollo

class Utility {
    
    static func setThumbnailImage(thumbnailImageURL: String) -> UIImage? {
        guard let url = URL(string: thumbnailImageURL) else { return nil }
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            return UIImage(data: imageData)
        }
        return nil
    }
    
    static func handleGraphQLError(errors: [GraphQLError]){
        let message = errors
            .map { $0.localizedDescription }
            .joined(separator: "\n")
        
        PostAlerts.presentAlertController(titleMsg: "Error", errorMsg: message)
    }
    
    static func isAnimatedImage(_ data: Data) -> Bool {
        if let source = CGImageSourceCreateWithData(data as CFData, nil) {

            let count = CGImageSourceGetCount(source)
            return count > 1
        }
        return false
    }
    
    static func fromGif(gifData: Data) -> [UIImage]? {

        guard let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        return images
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
