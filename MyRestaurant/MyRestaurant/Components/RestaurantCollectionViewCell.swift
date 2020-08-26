//
//  RestaurantCollectionViewCell.swift
//  MyRestaurant
//
//  Created by Cornerstone on 2020-08-20.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameView: UITextView = {
        let textV = UITextView.init()
        textV.translatesAutoresizingMaskIntoConstraints = false
        textV.textAlignment = .left
        return textV
    }()
    
    let priceRateView: UITextView = {
        let textV = UITextView.init()
        textV.translatesAutoresizingMaskIntoConstraints = false
        textV.textAlignment = .right
        return textV
    }()
    
    var name: String? {
        didSet {
            nameView.text = name
        }
    }
    
    var priceRate: String? {
        didSet {
            priceRateView.text = priceRate
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let stackText = UIStackView.init(arrangedSubviews: [nameView, priceRateView])
        
        stackText.axis = .horizontal
        stackText.distribution = .fillEqually
        imageView.constraintHeight(equalToConstant: frame.size.height * 0.85)
        let stack = UIStackView.init(arrangedSubviews: [imageView, stackText])
        stack.axis = .vertical
        stack.distribution = .fill
        contentView.addSubview(stack)
        stack.matchParent()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
