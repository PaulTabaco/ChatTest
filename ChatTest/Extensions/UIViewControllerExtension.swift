//
//  UIViewControllerExtension.swift
//  ChatTest
//
//  Created by Paul on 05.06.17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private static func storyboardInstancePrivate<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        // swiftlint:disable force_cast
        return storyboard.instantiateInitialViewController() as! T
        // swiftlint:enable force_cast
    }
    
    static func storyboardInstance() -> Self {
        return storyboardInstancePrivate()
    }
    
    static func navigationStoryboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        // swiftlint:disable force_cast
        return storyboard.instantiateInitialViewController() as! UINavigationController
        // swiftlint:enable force_cast
    }
}
