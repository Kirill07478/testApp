//
//  DetailingRouter.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import Foundation

protocol DetailingRoutingLogic {
    
}

protocol DetailingDataPassingProtocol {
    var dataStore: DetailingStoreProtocol? { get set }
}

class DetailingRouter: DetailingDataPassingProtocol {
    
    weak var dataStore: DetailingStoreProtocol?
    
}

//MARK: - Navigation Logic
extension DetailingRouter: DetailingRoutingLogic {
    
    
    
}
