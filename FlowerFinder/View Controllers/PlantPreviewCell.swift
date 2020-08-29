//
//  PlantPreviewCell.swift
//  FlowerFinder
//
//  Created by Justin Lycklama on 2020-08-27.
//  Copyright © 2020 Justin Lycklama. All rights reserved.
//

import UIKit
import ClassicClient

class PlantPreviewCell: UICollectionViewCell {

    var gradientLayer: CAGradientLayer?
    
    @IBOutlet private var titleLabel: PlantTitleView!
    @IBOutlet private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = WreathedDetailView.CornerRaduis
//        backgroundColor = .white
        
//        let lightGreen = UIColor.init(rgb: 0xedc4b3)
//        let darkGreen = UIColor.init(rgb: 0xc38e70)
        
        
//        let borderColor = UIColor.init(rgb: 0xaacc00)
                
//        let lightGreen = UIColor.init(rgb: 0xdddf00)
//        let darkGreen = UIColor.init(rgb: 0x2b9348)
//
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [lightGreen.cgColor, darkGreen.cgColor]
//        self.layer.insertSublayer(gradientLayer, at: 0)
        
        
//        gradientLayer = FFStyle.addCustomGradient(gradientSet: FFStyle.plantCellGradientSet, toView: self)
        
        
        imageView.layer.cornerRadius = WreathedDetailView.CornerRaduis
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        imageView.image = imageView.image?.roundedImage
        
        
//        imageView.layer.borderColor = UIColor.black.cgColor
//        imageView.layer.borderWidth = 1
        
//        layer.borderColor = UIColor.black.cgColor
//        layer.borderWidth = 2
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.backgroundColor = FFStyle.plantCellBackgroundColor
        blurEffectView.alpha = 0.45

        let bgView = UIImageView()
        bgView.image = UIImage(named: "brown-crystal")
        
        bgView.contentMode = .scaleAspectFill
        
        
        bgView.addSubview(blurEffectView)
        bgView.constrainSubviewToBounds(blurEffectView)
        
        
        self.backgroundView = bgView
        

        
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
          
        gradientLayer?.frame = bounds
    }
}
