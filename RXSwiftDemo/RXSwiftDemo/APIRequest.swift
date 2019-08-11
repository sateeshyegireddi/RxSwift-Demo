//
//  APIRequest.swift
//  RXSwiftDemo
//
//  Created by Sateesh Yegireddi on 11/08/19.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

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
            fatalError("APIRequest.request(with \(baseURL)): Unable to create URL components")
        }
        
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        
        guard let url = components.url else {
            fatalError("APIRequest.request(with \(baseURL)): Could not get url")
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
