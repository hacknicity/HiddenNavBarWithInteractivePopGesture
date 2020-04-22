//
//  PassthroughNavigationBar.swift
//  HiddenNavBarWithInteractivePopGesture
//
//  Created by Geoff Hackworth on 22/04/2020.
//  Copyright © 2020 Hacknicity. All rights reserved.
//

import UIKit

class PassthroughNavigationBar: UINavigationBar {

    // When the navigation controller's top view controller is a subclass of TransparentNavBarViewController, do not respond to touches in the navigation bar at all.
    // This allows buttons behind the navigation to receive the touches instead
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let rootViewController = self.window?.rootViewController as? UINavigationController,
            rootViewController.topViewController is TransparentNavBarViewController {
            return false
        } else {
            return super.point(inside: point, with: event)
        }
    }
}
