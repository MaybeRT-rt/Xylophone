//
//  XylophoneViewController.swift
//  Xylophone
//
//  Created by Liz-Mary on 31.10.2023.
//

import UIKit

class XylophoneViewController: UIViewController {
    
    let xylophoneView = XylophoneView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        view.addSubview(xylophoneView.stackViewButton)
        
        NSLayoutConstraint.activate([
        xylophoneView.stackViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        xylophoneView.stackViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        xylophoneView.stackViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        xylophoneView.stackViewButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        
       
        ])
    }

}

