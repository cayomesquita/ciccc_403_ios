//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
    setupBoxes()
  }
    
    fileprivate func setupBoxes() {
        setupPurpleBox()
        setupRedBox()
        setupBlueBoxes()
    }
    
    fileprivate func setupPurpleBox() {
        let purpleBox = UIView(frame: CGRect.zero)
        purpleBox.translatesAutoresizingMaskIntoConstraints = false
        purpleBox.backgroundColor = .purple
        mainView.addSubview(purpleBox)
        
        purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6).isActive = true
        purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        purpleBox.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    fileprivate func setupRedBox() {
        let redBox = UIView(frame: CGRect.zero)
        redBox.translatesAutoresizingMaskIntoConstraints = false
        redBox.backgroundColor = .red
        mainView.addSubview(redBox)
        
        redBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
        redBox.widthAnchor.constraint(equalToConstant: 200).isActive = true
        redBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        redBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        
        let nestedBox1 = UIView(frame: CGRect.zero)
        nestedBox1.translatesAutoresizingMaskIntoConstraints = false
        nestedBox1.backgroundColor = .orange
        let nestedBox2 = UIView(frame: CGRect.zero)
        nestedBox2.translatesAutoresizingMaskIntoConstraints = false
        nestedBox2.backgroundColor = .orange
        redBox.addSubview(nestedBox1)
        redBox.addSubview(nestedBox2)
        
        let margin: CGFloat = 10.0
        nestedBox1.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: margin).isActive = true
        nestedBox1.topAnchor.constraint(equalTo: redBox.topAnchor, constant: margin).isActive = true
        nestedBox1.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -margin).isActive = true
        nestedBox1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        nestedBox2.leadingAnchor.constraint(equalTo: nestedBox1.trailingAnchor, constant: margin).isActive = true
        nestedBox2.topAnchor.constraint(equalTo: redBox.topAnchor, constant: margin).isActive = true
        nestedBox2.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -margin).isActive = true
        nestedBox2.trailingAnchor.constraint(equalTo: redBox.trailingAnchor, constant: -margin).isActive = true
    }
    
    fileprivate func setupBlueBoxes() {
        let blueBox1 = UIView(frame: CGRect.zero)
        blueBox1.translatesAutoresizingMaskIntoConstraints = false
        blueBox1.backgroundColor = .blue
        blueBox1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        blueBox1.heightAnchor.constraint(equalTo: blueBox1.widthAnchor, multiplier: 1).isActive = true
        let blueBox2 = UIView(frame: CGRect.zero)
        blueBox2.translatesAutoresizingMaskIntoConstraints = false
        blueBox2.backgroundColor = .blue
        blueBox2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        blueBox2.heightAnchor.constraint(equalTo: blueBox2.widthAnchor, multiplier: 1).isActive = true
        let blueBox3 = UIView(frame: CGRect.zero)
        blueBox3.translatesAutoresizingMaskIntoConstraints = false
        blueBox3.backgroundColor = .blue
        blueBox3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        blueBox3.heightAnchor.constraint(equalTo: blueBox3.widthAnchor, multiplier: 1).isActive = true
        
        let top = UIView(frame: CGRect.zero)
        top.translatesAutoresizingMaskIntoConstraints = false
        let bottom = UIView(frame: CGRect.zero)
        bottom.translatesAutoresizingMaskIntoConstraints = false
        
        let stack = UIStackView(arrangedSubviews: [top, blueBox1, blueBox2, blueBox3, bottom])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalCentering
        mainView.addSubview(stack)
        
        stack.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: mainView.heightAnchor).isActive = true
    }
        

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

