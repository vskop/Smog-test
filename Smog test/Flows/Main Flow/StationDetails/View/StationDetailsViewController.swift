//
//  StationDetailsViewController.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import UIKit
import Bond
import SVProgressHUD

class StationDetailsViewController: UIViewController {
    
    var viewModel: StationDetailsViewModel!
    private lazy var mainView = StationDetailsView()
        
    // MARK: - Initialization
    init(viewModel: StationDetailsViewModel) {
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

        title = "Indeks jakości"
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
        
        viewModel.airQuality.bind(to: self) { (me, value) in
            guard let airQuality = value, let levelName = airQuality.pm10IndexLevel?.indexLevelName else { return }

            me.mainView.titleLabel.text = "Poziom pyłu jest " + levelName
        }
    }
    
}
