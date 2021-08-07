//
//  StationListView.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit

final class StationListView: UIView {
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        return tableView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    var topSeparatorViewConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
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
        registerCells()
    }
    
    private func setUpSubviews() {
        addSubview(tableView)
        addSubview(separatorView)
        topSeparatorViewConstraint = topAnchor.constraint(equalTo: separatorView.topAnchor)
        
        backgroundColor = .white
    }
    
    private func setUpLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topSeparatorViewConstraint,
            separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorViewHeight),
            separatorView.leftAnchor.constraint(equalTo: leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            
            tableView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            leftAnchor.constraint(equalTo: tableView.leftAnchor),
            rightAnchor.constraint(equalTo: tableView.rightAnchor),
            bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
    
    private func registerCells() {
        tableView.register(StationListTableViewCell.self, forCellReuseIdentifier: StationListTableViewCell.identifier)
    }

}

extension StationListView {
    
    private struct Constants {
        static let separatorViewHeight: CGFloat = 2.0
    }
    
}
