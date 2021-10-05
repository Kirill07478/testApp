//
//  DetailingInteractor.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import Foundation

protocol DetailingBusinessLogic {
    func fetchDetails()
}

protocol DetailingStoreProtocol: class {
    var elementId: Int { get set }
}

class DetailingInteractor: DetailingStoreProtocol {
 
    //MARK: - External vars
    var presenter: DetailingPresentationLogic?
    
    //MARK: - Internal vars
    var elementId: Int = -1
    var cities = [DetailingWeatherModel]()
}

//MARK: - Business Logic
extension DetailingInteractor: DetailingBusinessLogic {
    
    func fetchDetails() {
        print("ID принял - \(elementId)")
        
        URLWeatherService.firstRequest(elementId: elementId) { [weak self] city in
            self?.cities.append(city)
            print(self?.cities)
            
            let city = self?.cities[0]
            
            self?.presenter?.present(data: city!)
            
            }
        }
}
