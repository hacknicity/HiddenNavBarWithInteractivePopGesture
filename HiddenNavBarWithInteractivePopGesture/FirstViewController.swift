//
//  FirstViewController.swift
//  HiddenNavBarWithInteractivePopGesture
//
//  Created by Geoff Hackworth on 22/04/2020.
//  Copyright © 2020 Hacknicity. All rights reserved.
//

import UIKit

class FirstViewController: TransparentNavBarViewController {

    @IBOutlet weak var customNavigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        let transparentBarAppearance = UINavigationBarAppearance()
        transparentBarAppearance.configureWithTransparentBackground()

        customNavigationBar.compactAppearance = transparentBarAppearance
        customNavigationBar.standardAppearance = transparentBarAppearance
        customNavigationBar.scrollEdgeAppearance = transparentBarAppearance
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if let navigationBarFrame = navigationController?.navigationBar.frame {
            customNavigationBar.frame = navigationBarFrame
            print("set customNavigationBar.frame to \(customNavigationBar.frame)")
        }
//        customNavigationBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
    }
}
