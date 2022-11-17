//
//  AddWeatherViewModel.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 11/11/22.
//

import Foundation
import UIKit

protocol AddWeatherViewModelDelegate {
    func loading(_ show: Bool)
    func weatherLoaded()
}

final class AddWeatherViewModel{
    
    var delegate: AddWeatherViewModelDelegate?
    
    var weatherObjc: WeatherObjc?
    var coordinator: AddWeatherCoordinator?
    
    init(delegate: AddWeatherViewModelDelegate?, coordinator: AddWeatherCoordinator) {
        self.delegate = delegate
        self.coordinator = coordinator
    }
    
    func addWeatherCity(_ city: String?,_ completion: @escaping (_ result: WeatherObjc?) -> Void){
        
        if let _city = city {
            let weatherURL = urlForWeatherByCity(city: _city)
            
            let weatherResource = Resource<WeatherObjc>(url: weatherURL) {data in
                let weatherResponse = try? JSONDecoder().decode(WeatherObjc.self, from: data)
                return weatherResponse
            }
            
            WebService().load(resource: weatherResource) {(result) in
                if let weatherObjc = result {
                    completion(weatherObjc)
                }
            }
        }
    }
    
    func loadWeatherCity(_ city: String){
        addWeatherCity(city) { result in
            if let _result = result {
                self.weatherObjc = _result
                self.delegate?.weatherLoaded()
            }
        }
    }
    
    func dismissView(){
        coordinator?.dismiss()
    }
    
    func urlForWeatherByCity(city: String) -> URL{
//        let userDeafaults = UserDefaults.standard
//        let unit = (userDeafaults.value(forKey: "units") as? String) ?? "metric"
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=ef53df87ac746c87522688ea82936184&units=metric&lang=pt")!
    }
}
