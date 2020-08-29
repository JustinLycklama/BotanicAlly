//
//  PlantDetailsViewController.swift
//  FlowerFinder
//
//  Created by Justin Lycklama on 2020-08-12.
//  Copyright © 2020 Justin Lycklama. All rights reserved.
//

import UIKit
import ClassicClient

class PlantDetailsViewController: WreathedDetailViewController {
    override var viewType: WreathedDetailView.Type {
        return PlantDetailView.self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let treffle = Trefle()
//        Trefle.request()
        
//        self.navigationController?.navigationBar.isHidden = false
        
        let tapCloseRecog = UITapGestureRecognizer(target: self, action: #selector(back))
        
        tapCloseRecog.delegate = self
        
        self.view.addGestureRecognizer(tapCloseRecog)
        
        FFStyle.addBackgroundGradient(toView: self.view)

//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .done, target: self, action: #selector(back))
        
        
//        let backButton = UIButton(type: .close)
        if let plantDetailView = detailView as? PlantDetailView {
            plantDetailView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        }
        //
//        detailView.addSubview(backButton)
//        detailView.constrainSubviewToBounds(backButton)
//
//        let anyView = UIView()
//        anyView.backgroundColor = .red
//
//        self.view.addSubview(anyView)
//        self.view.constrainSubviewToBounds(anyView)
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}


extension WreathedDetailViewController : UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
}
