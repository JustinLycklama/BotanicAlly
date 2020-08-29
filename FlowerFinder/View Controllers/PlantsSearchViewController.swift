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
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = false

        FFStyle.addBackgroundGradient(toView: self.view)
        setTransition(t: WreathedDetailTransition(PlantDetailView.self))
        
        registerNib(xib: UINib(nibName: "PlantPreviewCell", bundle: nil), identifier: "pcell")
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pcell", for: indexPath) as? PlantPreviewCell else {
            return UICollectionViewCell()
        }
        
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, didSelectItemAt: indexPath)
        
        let detailVC = PlantDetailsViewController()
        
        
//        navCont.modalPresentationStyle = .overCurrentContext
//        navCont.transitioningDelegate = self
        
    
        
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        
        
    }


}

