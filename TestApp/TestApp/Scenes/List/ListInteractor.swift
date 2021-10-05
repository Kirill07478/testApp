//
//  ListInteractor.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import Foundation

protocol ListBusinessLogic {

    func fetchList()

}

class ListInteractor {
    
    //MARK: - External vars
    var presenter: ListPresentationLogic?
    
}

//MARK: - Business Logic
extension ListInteractor: ListBusinessLogic {
    
    func fetchList() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            var backendResponse = [ListBackendModel]()
            
            //MARK: - Data Source
            
            let moscow = ListBackendModel(elementId: "524894",
                                         titleText: "Moscow")
            let london = ListBackendModel(elementId: "5056033",
                                         titleText: "London")
            let dublin = ListBackendModel(elementId: "7778677",
                                         titleText: "Dublin")
            let newyork = ListBackendModel(elementId: "5039192",
                                         titleText: "New York")
            let tokyo = ListBackendModel(elementId: "1850147",
                                         titleText: "Tokyo")
            
            
            backendResponse.append(moscow)
            backendResponse.append(london)
            backendResponse.append(dublin)
            backendResponse.append(newyork)
            backendResponse.append(tokyo)

            
            self.presenter?.present(data: backendResponse)
        }
    }
}

