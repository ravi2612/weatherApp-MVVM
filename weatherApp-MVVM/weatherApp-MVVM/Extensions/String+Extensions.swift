//
//  String+Extensions.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 13/11/22.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
