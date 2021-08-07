//
//  StationListTableViewCell.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit

private extension StationListTableViewCell {
    struct Constant {
        static let shadowOffsetY: CGFloat = 4.0
        static let shadowOffsetX: CGFloat = 3.0
    }
}

final class StationListTableViewCell: UITableViewCell {
    
    private lazy var viewsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4.0
        return stackView
    }()
    
    private lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var stationNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        return label
    }()
    
    public static var identifier = "StationListTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupViewsContainer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        setupViewsContainer()
    }
    
    private func setupViewsContainer() {
        addSubview(viewsContainer)
        viewsContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: viewsContainer.topAnchor, constant: -18.0),
            leftAnchor.constraint(equalTo: viewsContainer.leftAnchor),
            rightAnchor.constraint(equalTo: viewsContainer.rightAnchor, constant: Constant.shadowOffsetX),
            bottomAnchor.constraint(equalTo: viewsContainer.bottomAnchor)
        ])
        
    }
    
    private func setupStackView() {
        stackView.addArrangedSubview(cityNameLabel)
        stackView.addArrangedSubview(stationNameLabel)
        viewsContainer.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: viewsContainer.topAnchor, constant: 13.0),
            stackView.leftAnchor.constraint(equalTo: viewsContainer.leftAnchor, constant: 15.0),
            stackView.rightAnchor.constraint(equalTo: viewsContainer.rightAnchor, constant: 15.0),
            stackView.bottomAnchor.constraint(equalTo: viewsContainer.bottomAnchor, constant: -16.0)
        ])
    }
    
    func setup(with station: MeasuringStation) {
        cityNameLabel.text = station.city?.name
        stationNameLabel.text = station.stationName
    }
    
}
