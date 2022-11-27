//
//  HomeWeatherViewModel.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import Foundation

protocol HomeWeatherViewModelDelegate {
    func loading(_ show: Bool)
    func weatherloaded(_ loaded: Bool)
}

final class HomeWeatherViewModel {
    
    var delegate: HomeWeatherViewModelDelegate?
    var coordinator: HomeCoordinator?
    
    var weatherList: [WeatherObjc] = []
    
    var weatherObjc: WeatherObjc?
    
    var citiesnames: [String] = []
    
    init(delegate: HomeWeatherViewModelDelegate?) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTb), name: ConstantsHome.Notification.ReloadTableViewHomeWeather, object: nil)
        self.delegate = delegate
        verifyCitiesList()
    }
    
    @objc func reloadTb(){
        self.delegate?.weatherloaded(true)
    }
    
    func numberOfRowsInSection() -> Int{
        return weatherList.count
    }
    
    func showAddWeatherView(_ delegate: AddWeatherObjcDelegate){
        coordinator?.startAddWeatherView(delegate)
    }
    
    private func verifyCitiesList(){
        Preferences.citiesNameList = Preferences.citiesNameList.uniqued()
        citiesnames = Preferences.citiesNameList
        if !citiesnames.isEmpty {
            citiesnames.forEach { city in
                loadWeatherCity(city)
            }
        }
    }
    
    func addWeatherCity(_ city: String?,_ completion: @escaping (_ result: WeatherObjc?) -> Void){
        
        if let _city = city {
            
            WebService().request(method: .get,
                                 baseURL: "https://api.openweathermap.org/data/2.5/weather?q=\(_city.escaped())&appid=d4a244e7014546bd6cfe7a1d0d58dea6&units=metric&lang=pt",
                                 endpoint: "",
                                 parameters: [:],
                                 responseType: WeatherObjc.self) { response, code in
                if code == 200 {
                    if let _response = response {
                        completion(_response as? WeatherObjc)
                    }
                }
            }
        }
    }
    
    func loadWeatherCity(_ city: String){
        
        addWeatherCity(city) { result in
            if let _result = result {
                self.weatherList.append(_result)
                self.weatherObjc = _result
                self.delegate?.weatherloaded(true)
            }
        }
    }
}

