//
//  Preferences.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 16/11/22.
//

import Foundation

class Preferences: NSObject {
    
    public static var listCities: [WeatherObjc] {
        get {return (UserDefaults.standard.mutableArrayValue(forKey: "listCities")) as? [WeatherObjc] ?? []}
        set (newValue) {UserDefaults.standard.set([], forKey: "listCities")}
    }
}
