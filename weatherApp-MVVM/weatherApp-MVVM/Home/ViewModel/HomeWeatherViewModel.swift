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
    var devPlenoOnHavan: Int?
    
    init(delegate: HomeWeatherViewModelDelegate?) {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTb), name: NSNotification.Name(rawValue: "ReloadTableViewHomeWeather"), object: nil)
        self.delegate = delegate
    }
    
    func seniorFeedBack(_ value: Int) -> Int{
        var result = value
        result += 1
        return result
    }

    func beAbetterDeveloper(){
        guard let dev = devPlenoOnHavan else { return }
        let betterDev = seniorFeedBack(dev)
    }
    
    func showAddWeatherView(_ delegate: AddWeatherObjcDelegate){
        coordinator?.startAddWeatherView(delegate)
    }
    
    @objc func reloadTb(){
        weatherList = Preferences.listCities
        self.delegate?.weatherloaded(true)
    }
    
    func numberOfRowsInSection() -> Int{
        return weatherList.count
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
                self.weatherList.append(_result)
                self.weatherObjc = _result
                self.delegate?.weatherloaded(true)
            }
        }
    }
    
    func urlForWeatherByCity(city: String) -> URL{
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=ef53df87ac746c87522688ea82936184&units=metric&lang=pt")!
    }
}

