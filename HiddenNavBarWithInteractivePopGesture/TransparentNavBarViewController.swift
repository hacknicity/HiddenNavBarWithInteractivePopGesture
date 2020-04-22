//
//  TransparentNavBarViewController.swift
//  HiddenNavBarWithInteractivePopGesture
//
//  Created by Geoff Hackworth on 22/04/2020.
//  Copyright © 2020 Hacknicity. All rights reserved.
//

import UIKit

class TransparentNavBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // We want the navigation bar to be clear
        let transparentBarAppearance = UINavigationBarAppearance()
        transparentBarAppearance.configureWithTransparentBackground()

        // With an invisible back button
        let transparentImage = UIImage(named: "OnePixelTransparentImage")
        transparentBarAppearance.setBackIndicatorImage(transparentImage, transitionMaskImage: transparentImage)

        // With clear back button title text
        let transparentButtonAppearance = UIBarButtonItemAppearance()
        transparentButtonAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.clear]
        transparentBarAppearance.backButtonAppearance = transparentButtonAppearance

        // For all appearance styles
        navigationItem.compactAppearance = transparentBarAppearance
        navigationItem.standardAppearance = transparentBarAppearance
        navigationItem.scrollEdgeAppearance = transparentBarAppearance
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
