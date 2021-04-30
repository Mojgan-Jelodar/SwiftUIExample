//
//  UserService.swift
//  KianDigital
//
//  Created by mozhgan on 4/28/21.
//

import Foundation
import Combine

protocol UserFetchable {
  func users() -> AnyPublisher<[Contact], NetworkError>
}
struct  UserService {
    let baseUrl = "https://60859fb1d14a8700175780be.mockapi.io/api"
    private let session: URLSession
    
    init(session: URLSession = .shared) {
      self.session = session
    }
}

extension UserService : UserFetchable {
    func users() -> AnyPublisher<[Contact], NetworkError> {
        
        guard let url = URL(string: baseUrl + "/users") else {
            return Fail(error: NetworkError.network(description: "Invalid path!!!") ).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { (error) in
                NetworkError.network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                Data.decodeArray(pair.data)
            }
            .eraseToAnyPublisher()
    }
}
