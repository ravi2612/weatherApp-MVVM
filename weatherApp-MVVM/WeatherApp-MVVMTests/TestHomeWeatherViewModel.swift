//
//  TestHomeWeatherViewModel.swift
//  WeatherApp-MVVMTests
//
//  Created by Ravi navarro on 22/11/22.
//

import XCTest
@testable import WeatherApp_MVVM

final class TestHomeWeatherViewModel: BaseTestCase{
    var viewModel: HomeWeatherViewModel!
    
    override func setUp() {
        super.setUp()
        
        Preferences.citiesNameList = []
        viewModel = .init(delegate: self)
    }
    
    override func tearDown() {
        viewModel = nil
        Preferences.citiesNameList = []
        super.tearDown()
    }
    
    func testNumberOfRowsInSection(){
        XCTAssertNotNil(viewModel.numberOfRowsInSection())
    }
    
    func testNumberOsRowsInSectionNotEmpty(){
        viewModel.loadWeatherCity("")
        XCTAssertNotEqual(viewModel.numberOfRowsInSection(), 0)
    }
    
    func testVerifyCitiesList(){
        Preferences.citiesNameList = [""]
        viewModel.verifyCitiesList()
        XCTAssertTrue(!viewModel.citiesnames.isEmpty)
    }
}

extension TestHomeWeatherViewModel: HomeWeatherViewModelDelegate {
    func loading(_ show: Bool) {}
    func weatherloaded(_ loaded: Bool) { }
}
