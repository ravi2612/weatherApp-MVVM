//
//  Mock.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 22/11/22.
//

import Foundation

enum MockType: String {
    case none
    case error
    case weather
}

class Mock {
    
    let fileManager = FileManager()
    
    static let shared = Mock()
    
    func load(type: MockType) -> Data? {
        
        if type == .none {
            return nil
        }
        
        var data: Data? = nil
        if let path = Bundle.main.path(forResource: type.rawValue, ofType: "json"),
            fileManager.fileExists(atPath: path) {
            data = fileManager.contents(atPath: path)
            self.log(data, type.rawValue)
        }
        return data
    }
    
    private func log(_ data: Data?, _ mock: String) {
        if let aux = data,
            let response = String(data: aux, encoding: String.Encoding.utf8) {
            print("\n==================== Loading Mock: \(mock) ====================\n")
            print(response)
            print("\n===============================================================\n")
        }
    }
}
