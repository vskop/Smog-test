//
//  StationListViewController.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit
import Bond
import SVProgressHUD

class StationListViewController: UIViewController {
    
    var viewModel: StationListViewModel!
    private lazy var mainView = StationListView()
        
    // MARK: - Initialization
    
    init(viewModel: StationListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        title = "Lista miast"
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.viewDidAppear()
    }
    
    // MARK: - Binding
    func bindViewModel() {
        viewModel.refreshing.bind(to: self) { (_, refreshing) in
            if refreshing {
               print("SHOW HUD")
                SVProgressHUD.show()
            } else {
                print("DISMISS HUD")
                SVProgressHUD.dismiss()

            }
        }
        
        viewModel.error.bind(to: self) { (me, value) in
            guard let error = value as? SmogError else {return}
            
            let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in }))
            me.present(alert, animated: true, completion: nil)
            
        }
        
        viewModel.allStations.bind(to: self) { (me, value) in
            guard let allStations = value else { return }
            
            print(allStations)
            me.mainView.tableView.reloadData()
        }
    }
    
}

extension StationListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
    
}

extension StationListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allStations.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StationListTableViewCell.identifier, for: indexPath) as? StationListTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        if let station = viewModel.allStations.value?[indexPath.row] {
            cell.setup(with: station)
        }

        return cell
    }
    
}
