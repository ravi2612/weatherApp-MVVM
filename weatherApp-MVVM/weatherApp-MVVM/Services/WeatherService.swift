//
//  WeatherService.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 13/11/22.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

enum RequestType {
    case get
    case post
}

struct APIResponseException: Codable {
    
    var code: Int = 0
    var message: String?
    var exceptionMessage: String?
    
    enum CodingKeys: String, CodingKey {
        
        case code               = "statusCode"
        case message            = "message"
        case exceptionMessage   = "exceptionMessage"
    }
}

final class WebService: NSObject {
    
    static let unknowError = "Erro desconhecido! Entre em contato com o suporte."
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) {data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            }else {
                completion(nil)
            }
        }.resume()
    }

    
    let unknownError = APIResponseException(code: 0,
                                            message: unknowError,
                                            exceptionMessage: unknowError)
    
    func request<T: Decodable>(method: RequestType,
                               baseURL: String,
                               endpoint: String,
                               parameters: Dictionary<String, Any>,
                               responseType: T.Type,
                               mockType: MockType = .none,
                               completion: @escaping (_ response: Any?, _ code: Int) -> Void) {
        
        
        var requestURL: String = ""
        
        requestURL = baseURL + endpoint
        
        let request = NSMutableURLRequest()
        request.timeoutInterval = 60
        
        let session = URLSession.shared
        
        switch method {
            
        case .get:
            requestURL += parameters.buildQueryString()
            request.httpMethod = "GET"
            break
            
        case .post:
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            break
        }
        
        request.url = URL(string: requestURL)
        request.httpShouldHandleCookies = false
        
        print("------------------------------------------------------------------")
        print("Parameters: \(parameters)")
        print("Request URL: \(request.url!.absoluteString)")
        print("------------------------------------------------------------------")
        
        //---------------------------------------------------------
        //  Running tests
        //---------------------------------------------------------
        
        if Preferences.isRunningTests {
            
            if let mock = Mock.shared.load(type: mockType) {
                if T.self == String.self, let responseString = String(data: mock, encoding: .utf8) {
                    completion(responseString, 200)
                }else{
                    let parse = try? JSONDecoder().decode(T.self, from: mock)
                    completion(parse, 200)
                }
            }else{
                completion(nil, 200)
            }
            return
        }
        
        //---------------------------------------------------------
        //  Load API
        //---------------------------------------------------------
        
        DispatchQueue.global().async {
            
            let task = session.dataTask(with: request as URLRequest,
                                        completionHandler: {data, response, error -> Void in
                
                DispatchQueue.main.async {
                    
                    let responseCode = response?.getStatusCode() ?? 0
                    
                    guard error == nil else {
                        completion(nil, responseCode)
                        return
                    }
                    
                    if let responseData = data, responseData.count != 0 {
                        
                        if let responseString = String(data: responseData, encoding: .utf8) {
                            
                            print("Response: \(responseString)")
                            
                            do {
                                let error = try JSONDecoder().decode(APIResponseException.self,
                                                                     from: responseData)
                                completion(error, responseCode)
                                return
                            }catch{
                                
                                if T.self == String.self {
                                    completion(responseString, responseCode)
                                    return
                                }
                            }
                        }
                        
                        //  Parsing API result
                        
                        do {
                            
                            let parse = try JSONDecoder().decode(T.self, from: responseData)
                            completion(parse, responseCode)
                            
                        }catch{
                            
                            //  Handling parse error
                            
                            print(error)
                            
                            do {
                                let error = try JSONDecoder().decode(APIResponseException.self,
                                                                     from: responseData)
                                completion(error, responseCode)
                            }catch{
                                print(error)
                                completion(nil, responseCode)
                            }
                        }
                    }else{
                        completion(nil, responseCode)
                    }
                }
            })
            
            task.resume()
        }
    }
}
