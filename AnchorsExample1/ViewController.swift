//
//  ViewController.swift
//  AnchorsExample1
//
//  Created by James Rochabrun on 4/12/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        //showStackViewExample()
        showLayoutMarginGuidesExample()
    }
    
    func showStackViewExample() {
        
        title = "Anchors"
        
        //stackviews have not background color for performance purposes
        let container = UIStackView()
        container.axis = .vertical
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        
        let photoView = UIImageView(image: #imageLiteral(resourceName: "profile"))
        //add the view in the arrange subview
        container.addArrangedSubview(photoView)
        
        //MARK: CREATE ANOTHER STACKVIEW FOR BUTTONS
        let buttonsContainer = UIStackView()
        //        buttonsContainer.distribution = .equalSpacing
        buttonsContainer.spacing = 8
        buttonsContainer.alignment = .leading
        
        //adding space based in the layout margins
        buttonsContainer.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        buttonsContainer.isLayoutMarginsRelativeArrangement = true
        
        container.addArrangedSubview(buttonsContainer)
        
        
        let firstButton = UIButton()
        firstButton.setImage(#imageLiteral(resourceName: "distance"), for: .normal)
        buttonsContainer.addArrangedSubview(firstButton)
        
        let secondButton = UIButton()
        secondButton.setImage(#imageLiteral(resourceName: "price"), for: .normal)
        buttonsContainer.addArrangedSubview(secondButton)
        
        let thirdButton = UIButton()
        thirdButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        buttonsContainer.addArrangedSubview(thirdButton)
        
        //hacky fix
        buttonsContainer.addArrangedSubview(UIView())
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //using toplayout guide instead of hardcoding 64
            container.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 16),
            
            //we dont set the height because stackviews have intrinsiccontentheight and will resize based
            //on its childe content.
            
            //WE CAN CHANGE THE WIDTH OF THE BUTTONS IF WE WANT
            
            ])
    }
    
    func showLayoutMarginGuidesExample() {
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            redView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
        ])
    }
    
    
    
    
    
    
    
}

