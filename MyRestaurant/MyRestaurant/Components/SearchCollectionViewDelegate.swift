//
//  SearchCollectionViewCollectionViewController.swift
//  MyRestaurant
//
//  Created by Cornerstone on 2020-08-21.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit



class SearchCollectionViewDelegate: NSObject, UICollectionViewDataSource {
    
    let reuseIdentifier = "Cell"
    
    var filters = Type.allCases.map { ($0, false) }

    // MARK: UICollectionViewDataSource

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return filters.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        cell.constraintWidth(equalToConstant: 80.0)
        let (filter, active) = filters[indexPath.row]
        
        
        // Configure the cell
        let textV = UITextView.init()
        textV.textAlignment = .center
        textV.text = filter.rawValue
        textV.textContainer.maximumNumberOfLines = 1
        textV.font = .boldSystemFont(ofSize: UIFont.systemFontSize)
        textV.textColor = active ? .white : .systemBlue
        textV.backgroundColor = active ? .systemBlue : .white
        textV.isEditable = false
        
        cell.contentView.addSubview(textV)
        
        textV.matchParent()
        return cell
    }


}

extension SearchCollectionViewDelegate : UICollectionViewDelegate {
    
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
//        var (filter, active) = filters[indexPath.row]
//        self.filters[indexPath.row] = (filter, true)
    }
    
}
