//
//  DetailingViewController.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import UIKit

protocol DetailingDisplayLogic: class {
    
    func display(data: DetailingWeatherModel)
    
}

class DetailingViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var temperture: UILabel!
    
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
        let presenter = DetailingPresenter()
        let interactor = DetailingInteractor()
        let router = DetailingRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.dataStore = interactor

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchDetails()
    }

}

//MARK: - Display logic implemnetation
extension DetailingViewController: DetailingDisplayLogic {
    
    func display(data: DetailingWeatherModel) {
        
        nameCity.text = data.city
        temperture.text = "\(data.temp) градусов Цельсия"
        
    }
    
    
    
    
}
