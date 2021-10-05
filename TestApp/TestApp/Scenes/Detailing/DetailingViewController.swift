//
//  DetailingViewController.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import UIKit

class DetailingViewController: UIViewController {

    //MARK: - External vars
    private(set) var router: (DetailingRoutingLogic & DetailingDataPassingProtocol)?
    
    //MARK: - Internal vars
    private var interactor: (DetailingBusinessLogic & DetailingStoreProtocol)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        let viewController = self
        let interactor = DetailingInteractor()
        let router = DetailingRouter()
        viewController.interactor = interactor
        viewController.router = router
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchDetails()
    }

}
