//
//  PlantsDetailView.swift
//  FlowerFinder
//
//  Created by Justin Lycklama on 2020-08-27.
//  Copyright © 2020 Justin Lycklama. All rights reserved.
//

import UIKit
import ClassicClient

class PlantDetailView: WreathedDetailView {

    
    public let backButton = UIButton(type: .close)
    
//    required init() {
//        super.init()
//
//
//    }
//
//    required init?(coder: NSCoder) {
//    }
    
    override func initialize() {
        super.initialize()
        
//        backgroundColor = FFStyle.plantCellBackgroundColor
        
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.borderWidth = 2
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.backgroundColor = FFStyle.plantCellBackgroundColor
        
        blurEffectView.alpha = 0.35

        let bgView = UIImageView()
        bgView.image = UIImage(named: "brown-crystal")
        
        bgView.contentMode = .scaleAspectFill
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = WreathedDetailView.CornerRaduis

//        addSubview(blurEffectView)
//        sendSubviewToBack(blurEffectView)
        
        bgView.addSubview(blurEffectView)
        bgView.constrainSubviewToBounds(blurEffectView)
        
        addSubview(bgView)
        constrainSubviewToBounds(bgView)
        sendSubviewToBack(bgView)
        
        
        
//        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)

        
        
        
        let titleLabelArea = PlantTitleView()
        titleLabelArea.translatesAutoresizingMaskIntoConstraints = false
        

        
        addSubview(titleLabelArea)
        
        let views = ["label" : titleLabelArea]
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(8)-[label]", options: .alignAllCenterY, metrics: nil, views: views)
        
        let horizontalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[label]-(0)-|", options: .alignAllCenterX, metrics: nil, views: views)
        
     
        NSLayoutConstraint.activate(verticalConstraints + horizontalConstrains)
        
//        layoutIfNeeded()
        
    }
    
    override func completeTransition() {
//        backButton.setTitle("Back", for: .normal)
//        
//        self.addSubview(backButton)
//        self.constrainSubviewToBounds(backButton)
    }
}


class PlantTitleView : UIView {
    
    let title: UILabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialize()
    }
    
    func initialize() {
        backgroundColor = .clear
                
        addSubview(title)
        
        title.text = "Label"
        title.textAlignment = .center
        title.sizeToFit()
        title.textColor = FFStyle.plantTitleColor
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(title)
        
        let centerX = NSLayoutConstraint.init(item: title, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        
        let centerY = NSLayoutConstraint.init(item: title, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        let height = NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .equal, toItem: title, attribute: .height, multiplier: 1, constant: 8)
        
        NSLayoutConstraint.activate([centerX, centerY, height])
    }
    
    func setTitle(text: String) {
        title.text = text
        title.sizeToFit()
    }
}
