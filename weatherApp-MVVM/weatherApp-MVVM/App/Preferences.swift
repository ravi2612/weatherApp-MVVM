//
//  Preferences.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 16/11/22.
//

import Foundation

struct Preferences {
    
    public static var citiesNameList: [String] {
        
        get {return (UserDefaults.standard.stringArray(forKey: "citiesNameList")) ?? []}
        
        set (newValue) {UserDefaults.standard.set(newValue, forKey: "citiesNameList")}
    }
    
    private static var preferenceIsRunningTests = false
    
    public static var isRunningTests: Bool {
        
        get { return preferenceIsRunningTests }
        
        set (newValue) { preferenceIsRunningTests = newValue }
    }
}
