//
//  FFTabBarController.swift
//  FlowerFinder
//
//  Created by Justin Lycklama on 2020-08-29.
//  Copyright © 2020 Justin Lycklama. All rights reserved.
//

import UIKit

class FFTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barTintColor = FFStyle.tabBarBackgroundColor
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = tabBar.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //                blurEffectView.backgroundColor = FFStyle.plantCellBackgroundColor
        blurEffectView.alpha = 0.45
        
        
        
        tabBar.addSubview(blurEffectView)

    }
}
