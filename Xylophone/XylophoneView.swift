//
//  XylophoneView.swift
//  Xylophone
//
//  Created by Liz-Mary on 31.10.2023.
//

import UIKit

class XylophoneView: UIView {
    
    let xylophoneModel = XylophoneModel()   
    
    lazy var stackViewButton: UIStackView = {
        let stackButton = UIStackView()
        stackButton.translatesAutoresizingMaskIntoConstraints = false
        stackButton.axis = .vertical
        stackButton.spacing = 10
        stackButton.alignment = .center
        stackButton.distribution = .fillEqually
        return stackButton
    }()
    
    init() {
        super.init(frame: .zero)
        setupConstraints()
        //createButton()
        createdButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {

        addSubview(stackViewButton)
        
        NSLayoutConstraint.activate([
            stackViewButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackViewButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
         
        ])
    }
    func createButton(title: String, width: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        button.layer.cornerRadius = 15

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        stackViewButton.addArrangedSubview(button)

        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalTo: stackViewButton.widthAnchor, multiplier: width).isActive = true

        return button
    }
    
    

    func createdButtons() {
        for (index, nameButton) in xylophoneModel.nameButtons.enumerated() {
            let widthMultiplier = CGFloat(0.97 - (0.03 * Double(index)))
            createButton(title: nameButton, width: widthMultiplier)
        }
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        
    }
}
