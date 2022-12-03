//
//  TestAddWeatherViewModel.swift
//  WeatherApp-MVVMTests
//
//  Created by Ravi navarro on 02/12/22.
//

import XCTest
@testable import WeatherApp_MVVM

final class TestAddWeatherViewModel: BaseTestCase {

    
    var viewModel: AddWeatherViewModel!
    
    override func setUp() {
        super.setUp()
        let coordinator = AddWeatherCoordinator(navigationController: UINavigationController(), delegate: self)
        Preferences.citiesNameList = []
        
        viewModel = .init(delegate: self, coordinator: coordinator)
    }
    
    override func tearDown() {
        viewModel = nil
        Preferences.citiesNameList = []
        super.tearDown()
    }
    func testLoadWeatherCity(){
        viewModel.loadWeatherCity("")
        XCTAssertNotNil(viewModel.weatherObjc)
    }
    
    func testAddWeatherCity(){
        viewModel.addWeatherCity(nil) { result, error in
            XCTAssertNil(result)
        }
    }
    
}

extension TestAddWeatherViewModel: AddWeatherObjcDelegate,
                                   AddWeatherViewModelDelegate {
    func loading(_ show: Bool) {}
    func weatherLoaded() {}
    func error() {}
    func weatherObjc(objc: WeatherApp_MVVM.WeatherObjc) {
    }
}
