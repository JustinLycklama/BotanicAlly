//
//  ViewController.swift
//  Test
//
//  Created by Justin Lycklama on 2020-08-07.
//  Copyright © 2020 Justin Lycklama. All rights reserved.
//

import UIKit
import ClassicClient

class PlantsSearchViewController: HorizontalItemPreviewViewController {

    override func viewDidLoad() {
        super.viewDidLoad()            
        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.view.bounds
//        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.white.cgColor]
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        
        
        
        Trefle.request()
        
    }


}

