//
//  ViewController.swift
//  MyRestaurant
//
//  Created by Cornerstone on 2020-08-20.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var restaurants = Restaurant.fetchAll()
    
    private let padding: CGFloat = 8
    private let cellIdRestaurant = "cellIdRestaurant"
    private let cellIdSearch = "cellIdSearch"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: cellIdRestaurant)
        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()
    
    lazy var searchCollectionViewDelegate : SearchCollectionViewDelegate = {
        return SearchCollectionViewDelegate.init()
    }()
    
    lazy var searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        //        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = CGSize.init(width: 60.0, height: 30.0)
        let searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        searchCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: searchCollectionViewDelegate.reuseIdentifier)
        searchCollectionView.dataSource = searchCollectionViewDelegate
        searchCollectionView.delegate = searchCollectionViewDelegate
        return searchCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchView()
        setupCollectionView()
        setupUI()
    }

    func setupUI() {
        let title = UITextView.init(frame: .zero)
        title.text = "My Restaurant"
        title.backgroundColor = .none
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = .white
        navigationItem.titleView = title
        navigationController?.navigationBar.barTintColor = .systemBlue
        view.backgroundColor = .lightGray
        let stack = UIStackView.init(arrangedSubviews: [searchCollectionView, collectionView])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = padding
        view.addSubview(stack)
        let safeArea = view.safeAreaLayoutGuide
        stack.anchors(topAnchor: safeArea.topAnchor, leadingAnchor: safeArea.leadingAnchor, trailingAnchor: safeArea.trailingAnchor, bottomAnchor: view.bottomAnchor, padding: UIEdgeInsets.init(top: padding, left: padding, bottom: padding, right: 0))
//        stack.matchParent(padding: .init(top: padding, left: padding, bottom: padding, right: padding))
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .none
    }
    
    func setupSearchView() {
        searchCollectionView.backgroundColor = .none
        searchCollectionView.constraintHeight(equalToConstant: 30.0)
        
    }
    
}

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ViewController : UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdRestaurant, for: indexPath) as! RestaurantCollectionViewCell
        let restaurant = restaurants[indexPath.row]
        if let image = restaurant.image {
            cell.imageView.image = UIImage.init(named: image)
        }
        cell.name = restaurant.name
        cell.priceRate = restaurant.priceRate.rawValue
        return cell
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.width - 1 * padding) / 2.0
    return CGSize(width: width, height: width)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: padding * 2, left: 0, bottom: padding * 4, right: 0)
  }
}
