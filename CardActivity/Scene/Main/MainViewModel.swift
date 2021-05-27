//
//  MainViewModel.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 11/04/21.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    enum State {
        case loading
        case success(friends: [Friend])
        case failure(error: ErrorResponse)
    }
    
    @Published var state: State = .loading
    private var cancellation: AnyCancellable?
    
    func getFriends() {
        let service = FriendService(APIService())
        cancellation = service.getFriends(.friends).sink(receiveCompletion: { result in
            switch result {
            case .failure(let error):
                self.state = .failure(error: error)
            default:
                break
            }
        }, receiveValue: { value in
            self.state = .success(friends: value)
        })
    }
}
