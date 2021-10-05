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
    
    var elementId: Int = -1
    
}

//MARK: - Business Logic
extension DetailingInteractor: DetailingBusinessLogic {
    func fetchDetails() {
        print("ID принял - \(elementId)")
    }
    
    
}
