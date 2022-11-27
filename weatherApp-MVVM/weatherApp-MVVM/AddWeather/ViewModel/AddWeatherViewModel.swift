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
    func error()
}

protocol AddWeatherObjcDelegate {
    func weatherObjc(objc: WeatherObjc)
}

final class AddWeatherViewModel{
    
    var delegate: AddWeatherViewModelDelegate?
    
    var delegateObjc: AddWeatherObjcDelegate?
    
    var weatherObjc: WeatherObjc?
    var coordinator: AddWeatherCoordinator?
    
    init(delegate: AddWeatherViewModelDelegate?, coordinator: AddWeatherCoordinator) {
        self.delegate = delegate
        self.coordinator = coordinator
    }
    
    
    func addWeatherCity(_ city: String?,_ completion: @escaping (_ result: WeatherObjc?, _ error: Bool?) -> Void){
        
        guard let city = city else { return }
        
        WebService().request(method: .get,
                             baseURL: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=d4a244e7014546bd6cfe7a1d0d58dea6&units=metric&lang=pt",
                             endpoint: "",
                             parameters: [:],
                             responseType: WeatherObjc.self,
                             mockType: .weather) { response, code  in
            
            if let _response = response {
                completion(_response as? WeatherObjc, false)
            }else {
                completion(nil, true)
            }
        }
    }
    
    func loadWeatherCity(_ city: String){
        addWeatherCity(city) { result, error in
            
            if error ?? false {
                self.delegate?.error()
                return
            }
            
            if let _result = result {
                self.weatherObjc = _result
                Preferences.citiesNameList.append(city)
                self.delegateObjc?.weatherObjc(objc: _result)
                self.delegate?.weatherLoaded()
            }
        }
    }
    
    func dismissView(){
        coordinator?.dismiss()
    }
}
