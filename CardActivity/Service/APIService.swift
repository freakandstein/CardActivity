//
//  APIService.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 11/04/21.
//

import Foundation
import Combine

struct APIService {
    
    enum HTTPMethod: String {
        case GET
        case POST
        case PUT
    }
    
    static let baseURL = "http://0.0.0.0:30003/"
    
    func run(_ request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result in
                if let httpResponse = result.response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 503, 401:
                        throw try JSONDecoder().decode(ErrorResponse.self, from: result.data)
                    default:
                        return result.data
                    }
                } else {
                    throw ErrorResponse(errorCode: "6666", errorMessage: "Unknown Error") }
            }.receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
}
