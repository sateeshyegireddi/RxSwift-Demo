//
//  DataManager.swift
//  RXSwiftDemo
//
//  Created by Sateesh Yegireddi on 11/08/19.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

//https://www.netguru.com/codestories/networking-with-rxswift

class APIClient {
    private let baseURL = URL(string: "http://universities.hipolabs.com/")!
    
    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    observer.onError(error)
                    return
                }
                guard let data = data else {
                    observer.onError(ErrorType.noData.error)
                    return
                }
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(model)
                } catch {
                    observer.onError(ErrorType.JSON.error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

class UniversityRequest: APIRequest {
    var body: [String : Any]? = nil
    var method = HTTPMethod.GET
    var path = "search"
    var parameters = [String: String]()
    
    init(name: String) {
        parameters["name"] = name
    }
}

enum EndPoint: String {
    case baseURL = ""
}

enum ErrorType {
    case noData
    case JSON
    
    var error: NSError {
        switch self {
        case .noData:
            return NSError(domain: "No data has been received from server.", code: 400, userInfo: nil)
        case .JSON:
            return NSError(domain: "Error occured while parsing JSON response.", code: 400, userInfo: nil)
        }
    }
}
