//
//  ViewController.swift
//  JsonDecodable
//
//  Created by Victor Lee on 30/9/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let clickView: UIView = {
        let clickView = UIView()
        clickView.backgroundColor = .yellow
        clickView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return clickView
    }()
    
    let portfolioLabel: UILabel = {
        let portfolioLabel = UILabel()
        portfolioLabel.textColor = .black
        portfolioLabel.textAlignment = .center
        portfolioLabel.translatesAutoresizingMaskIntoConstraints = false
        return portfolioLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(clickView)
        clickView.center = view.center
        clickView.addSubview(portfolioLabel)
        portfolioLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        portfolioLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
