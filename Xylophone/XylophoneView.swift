//
//  XylophoneView.swift
//  Xylophone
//
//  Created by Liz-Mary on 31.10.2023.
//

import UIKit

class XylophoneView: UIView {
    
    lazy var stackViewButton: UIStackView = {
        let stackButton = UIStackView()
        stackButton.translatesAutoresizingMaskIntoConstraints = false
        return stackButton
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(stackViewButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackViewButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackViewButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
