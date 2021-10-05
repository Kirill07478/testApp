//
//  DetailingPresenter.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import Foundation

protocol DetailingPresentationLogic  {
    
    func present(data: DetailingWeatherModel)
    
}

class DetailingPresenter {
    
    //MARK: - External vars
    weak var viewController: DetailingDisplayLogic?
    
}


//MARK: - Presentation Logic
extension DetailingPresenter: DetailingPresentationLogic {
    
    func present(data: DetailingWeatherModel) {
        
        print(data.city)
        
        viewController?.display(data: data)
        
    }
    
}

