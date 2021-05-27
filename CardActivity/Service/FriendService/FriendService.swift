//
//  FriendService.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 11/04/21.
//

import Foundation
import Combine

struct FriendService {
    
    enum Path: String {
        case friends = "friends"
    }
    
    var apiService: APIService
    var baseURL: URL
    var parameter: [String: String] = [:]
    
    init(_ apiService: APIService) {
        guard let baseURL = URL(string: APIService.baseURL) else { fatalError("Base URL is not exist") }
        self.apiService = apiService
        self.baseURL = baseURL
    }
    
    func getFriends(_ path: Path) -> AnyPublisher<[Friend], ErrorResponse> {
        guard let components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true) else {
            fatalError("Couldn't create URLComponents")
        }
        guard let urlRequest = components.url else {
            fatalError("URLRequest cannot be created")
        }
        var request = URLRequest(url: urlRequest)
        request.httpMethod = APIService.HTTPMethod.GET.rawValue
        // Use JSONSerialization to change parameter to be as Data
        // request.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        return apiService.run(request).decode(type: [Friend].self, decoder: JSONDecoder()).mapError({ (error) -> ErrorResponse in
            if let error = error as? ErrorResponse {
                return error
            } else {
                return ErrorResponse(errorCode: "666", errorMessage: "Unknown Error")
            }
        }).eraseToAnyPublisher()
    }

    
}
