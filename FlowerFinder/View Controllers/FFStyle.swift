//
//  FFStyle.swift
//  FlowerFinder
//
//  Created by Justin Lycklama on 2020-08-28.
//  Copyright © 2020 Justin Lycklama. All rights reserved.
//

import UIKit

public typealias GradientSet = (start: UIColor, end: UIColor)

private struct ColorPalette {
    fileprivate static let darkTeal = UIColor(rgb: 0x006d77)
    fileprivate static let lightTeal = UIColor(rgb: 0x83c5be)
    
    
    fileprivate static let lightBrown = UIColor(rgb: 0xE0A890)
    fileprivate static let brownColor = UIColor(rgb: 0xA1683A)
    fileprivate static let offWhite = UIColor(rgb: 0xEDE6F2)
    fileprivate static let palePink = UIColor(rgb: 0xffddd2)
    fileprivate static let sunRay = UIColor(rgb: 0xEAB464)

    fileprivate static let mistyRose = UIColor(rgb: 0xEED2CC)
    fileprivate static let vividTangerine = UIColor(rgb: 0xE8998D)
    
    
    fileprivate static let lightGreen = UIColor.init(rgb: 0xdddf00)
    fileprivate static let darkGreen = UIColor.init(rgb: 0x2b9348)
    
}

public struct FFStyle {
    
    public static let backgroundGradientSet = (ColorPalette.lightTeal, ColorPalette.darkTeal)
    public static let plantCellGradientSet = (ColorPalette.lightGreen, ColorPalette.darkGreen)
    
    public static let plantCellBackgroundColor = ColorPalette.mistyRose.withAlphaComponent(0.30)
    public static let tabBarBackgroundColor = ColorPalette.brownColor.withAlphaComponent(0.35)
    
    public static let plantTitleColor = ColorPalette.vividTangerine
    
    @discardableResult
    public static func addBackgroundGradient(toView view: UIView) -> CAGradientLayer {
        return addCustomGradient(gradientSet: backgroundGradientSet, toView: view)
    }
    
    @discardableResult
    public static func addCustomGradient(gradientSet: GradientSet, toView view: UIView) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [gradientSet.start.cgColor, gradientSet.end.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        return gradientLayer
    }
}
