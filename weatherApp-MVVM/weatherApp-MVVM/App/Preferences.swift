//
//  Preferences.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 16/11/22.
//

import Foundation

struct Preferences {
    
    public static var listCities: [WeatherObjc] {
        get {return ((UserDefaults.standard.mutableArrayValue(forKey: "listCities")) as? [WeatherObjc]) ?? []}
        set (newValue) {UserDefaults.standard.set(newValue, forKey: "listCities")}
    }
    
    public static var citiesNameList: [String] {
        get {return (UserDefaults.standard.stringArray(forKey: "citiesNameList")) ?? []}
        set (newValue) {UserDefaults.standard.set(newValue, forKey: "citiesNameList")}
    }
}
