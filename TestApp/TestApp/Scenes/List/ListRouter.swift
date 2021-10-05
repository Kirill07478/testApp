//
//  ListRouter.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import Foundation
import UIKit

protocol ListRoutingLogic {
    func navigateToDetail(elementId: Int)
}

class ListRouter {
    
    weak var viewController: UIViewController?
    
    
    
}

//MARK: - Navigation Logic
extension ListRouter: ListRoutingLogic {
    
    func navigateToDetail(elementId: Int) {
        let storyboard = UIStoryboard.init(name: "DetailingViewController", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(identifier: "DetailingViewController") as? DetailingViewController else { return }
        
        detailVC.router?.dataStore?.elementId = elementId
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }

}
