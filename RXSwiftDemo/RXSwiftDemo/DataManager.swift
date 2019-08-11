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

enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol APIRequest {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String] { get }
    var body: [String: Any]? { get }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("request(with \(baseURL)): Unable to create URL components")
        }
        
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        
        guard let url = components.url else {
            fatalError("request(with \(baseURL)): Could not get url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = String(describing: method)
        if method == .POST {
            let httpBody = try? JSONSerialization.data(withJSONObject: body!, options: .prettyPrinted)
            request.httpBody = httpBody
        }
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}

class APIClient {
    private let baseURL = URL(string: "http://universities.hipolabs.com/")!
    
    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
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
