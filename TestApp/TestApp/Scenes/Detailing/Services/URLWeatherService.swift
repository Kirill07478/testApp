//
//  URLWeatherService.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import Foundation

class URLWeatherService {
    
    static func firstRequest (elementId: Int, completion: @escaping (DetailingWeatherModel) -> Void ) {

//        var city: DetailingWeatherModel
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let apiKey = "b97733c2cd4a8986f9ba9b98f7f69ca2"

        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?id=\(elementId)&lang=ru&units=metric&APPID=\(apiKey)") else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
//            print(data.prettyJSON)
            
            do {

                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
                
                let object = json as! [String:Any]
                let main = object["main"] as! [String:Any]
                
                let temp = main["temp"] as! Double
                let city = DetailingWeatherModel(citiesId: elementId, temp: temp)
                completion(city)

            } catch {
                print(error)
            }
                        
        }
        
        task.resume()

    }

}
