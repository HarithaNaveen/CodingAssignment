//
//  HomeApiService.swift
//  CatSpace
//
//  Created by 909547 on 03/07/20.
//  Copyright © 2020 909547. All rights reserved.
//

import Foundation
import Combine
import CoreData

struct HomeApiService {
    
    // MARK: Methods
    
    func getCatListPublisher() -> AnyPublisher<[CatInfo], Error>? {
        guard let url = URL(string: Urls.imageSearch) else {
            return nil
        }
        return publisher(for: url)
    }
    
    private func publisher<T: Codable>(for url: URL) -> AnyPublisher<[T], Error>? {
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.context] = CoreDataStack.shared.context
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map { response in
                return response.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [T].self, decoder: decoder)
            .eraseToAnyPublisher()
        return publisher
    }
}
