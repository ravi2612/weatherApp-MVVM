//
//  TestHomeWeatherViewModel.swift
//  WeatherApp-MVVMTests
//
//  Created by Ravi navarro on 22/11/22.
//

import XCTest
@testable import WeatherApp_MVVM

final class TestHomeWeatherViewModel: BaseTestCase, HomeWeatherViewModelDelegate {
    func loading(_ show: Bool) {}
    
    func weatherloaded(_ loaded: Bool) { }
    
    
    var viewModel: HomeWeatherViewModel!
    
    
    override func setUp() {
        super.setUp()
        
        viewModel = .init(delegate: self)
    }
    
    override func tearDown() {
        viewModel = nil
        
        super.tearDown()
    }
    
    func testNumberOfRowsInSection(){
        XCTAssertNotNil(viewModel.numberOfRowsInSection())
    }
    
}
