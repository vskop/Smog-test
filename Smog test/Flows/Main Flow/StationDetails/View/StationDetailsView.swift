//
//  StationDetailsView.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit

final class StationDetailsView: UIView {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = .clear
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        setUpSubviews()
        setUpLayout()
    }
    
    private func setUpSubviews() {
        addSubview(titleLabel)
        
        backgroundColor = .white
    }
    
    private func setUpLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0)

        ])
    }

}

