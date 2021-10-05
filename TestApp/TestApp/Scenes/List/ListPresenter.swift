//
//  ListPresenter.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import Foundation

protocol ListPresentationLogic  {
    
    func present(data: [ListBackendModel])
    
}

class ListPresenter {
    
    //MARK: - External vars
    weak var viewController: ListDisplayLogic?
    
}


//MARK: - Presentation Logic
extension ListPresenter: ListPresentationLogic {
    
    func present(data: [ListBackendModel]) {
        let viewModel = data.map {model -> ElementCellModel in
            let cellModel = ElementCellModel(titleText: model.titleText,
                                            elementId: model.elementId)
            return cellModel
        }
        
        viewController?.display(data: viewModel)
    }
}
