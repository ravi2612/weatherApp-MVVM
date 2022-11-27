//
//  BaseTestCase.swift
//  WeatherApp-MVVMTests
//
//  Created by Ravi navarro on 22/11/22.
//

import XCTest
@testable import WeatherApp_MVVM

 class BaseTestCase: XCTestCase {

    override func setUp() {
        Preferences.isRunningTests = true
        super.setUp()
    }
    
    override func tearDown() {
        Preferences.isRunningTests = false
        super.tearDown()
    }
}
