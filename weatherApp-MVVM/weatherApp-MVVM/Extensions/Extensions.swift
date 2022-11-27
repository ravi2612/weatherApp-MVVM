//
//  String+Extensions.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 13/11/22.
//

import Foundation


//-----------------------------------------------------------------------
//    MARK: - String
//-----------------------------------------------------------------------

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}

//-----------------------------------------------------------------------
//    MARK: - Dictionary
//-----------------------------------------------------------------------

extension Dictionary {
    
    func buildQueryString() -> String {
        
        var urlVars:[String] = []
        
        for (key, value) in self {
            
            if value is Array<Any> {
                
                for v in value as! Array<Any> {
                    
                    if let encodedValue = "\(v)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                        urlVars.append((key as! String) + "[]=" + encodedValue)
                    }
                }
            }else{
                
                if let val = value as? String {
                    if let encodedValue = val.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                        urlVars.append((key as! String) + "=" + encodedValue)
                    }
                }else{
                    urlVars.append((key as! String) + "=\(value)")
                }
            }
        }
        
        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
}

//-----------------------------------------------------------------------
//  MARK: - URLResponse
//-----------------------------------------------------------------------

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

//-----------------------------------------------------------------------
//  MARK: - Sequence
//-----------------------------------------------------------------------

public extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
