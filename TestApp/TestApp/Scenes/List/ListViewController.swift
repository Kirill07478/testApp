//
//  ListViewController.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import UIKit

protocol ListDisplayLogic: class {
    
    func display(data: [ElementCellModel])
    
}

class ListViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - External vars
    private(set) var router: ListRoutingLogic?
    
    
    //MARK: - Internal vars
    private var interactor: ListBusinessLogic?
    private var dataToDisplay = [ElementCellModel]()
    
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
        let presenter = ListPresenter()
        let interactor = ListInteractor()
        let router = ListRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        interactor?.fetchList()
    }
    
    //MARK: - Internal logic
    private func configureTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "ElementCell", bundle: nil), forCellReuseIdentifier: ElementCell.cellIdentifier)
        
    }

}


//MARK: - UITableViewDataSource & Delegate Implemnetation
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ElementCell.cellIdentifier, for: indexPath) as? ElementCell
        else { return UITableViewCell() }
        
        cell.setup(data: dataToDisplay[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

//MARK: - Cell Delegate
extension ListViewController: ElementCellDelegate {
    func didElementTap(elementId: Int) {
        router?.navigateToDetail(elementId: elementId)
    }
    
    
}

//MARK: - Display logic implemnetation
extension ListViewController: ListDisplayLogic {
    
    
    func display(data: [ElementCellModel]) {
        dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        tableView.reloadData()
    }
    
}
