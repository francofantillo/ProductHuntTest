//
//  PostAlerts.swift
//  My Idea Pool
//
//  Created by Franco on 2019-10-30.
//  Copyright © 2019 Franco Fantillo. All rights reserved.
//

import Foundation
import UIKit

class PostAlerts {
    static func presentAlertController(titleMsg: String, errorMsg: String, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .cancel, handler: nil)]) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: titleMsg, message: errorMsg, preferredStyle: .alert)
            // let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            for action in actions {
                alertController.addAction(action)
            }

            let keyWindow = UIApplication.shared.windows.first(where: \.isKeyWindow)
            var rootViewController = keyWindow?.rootViewController
            if let navigationController = rootViewController as? UINavigationController {
                rootViewController = navigationController.viewControllers.first
            }
            if let tabBarController = rootViewController as? UITabBarController {
                rootViewController = tabBarController.selectedViewController
            }
            if let presentedViewController = rootViewController?.presentedViewController {
                rootViewController = presentedViewController
            }

            rootViewController!.present(alertController, animated: true, completion: nil)
        }
    }

    static func goToLocationSettingsAlert() -> UIAlertController {
        let noThanksAction = UIAlertAction(title: "No Thanks", style: .default) { _ in
            // handle response here.
        }
        let yesAction = UIAlertAction(title: "Settings", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }

        let title = "Location Services"
        let message = "Would you like to turn on Location Services?  It required in order to share your wifi credentials with your device."
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(noThanksAction)
        alert.addAction(yesAction)
        return alert
    }
}

class WhiteTintAlertController: UIAlertController {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.tintColor = .white
    }
}
