//
//  MultiNetworkManager.swift
//  Beautiful Universe
//
//  Created by jeongyun on 11/11/23.
//

import Foundation
import Combine
import SwiftUI

class MultiNetworkManager: ObservableObject {
    
    @Published var infos = [PhotoInfo]()
    
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var daysFromToday: Int = 0
    
    init() {
        
//       let times = 0..<10
//       times.publisher
        $daysFromToday
            .map { daysFromToday in
               return API.createDate(daysFromToday: daysFromToday)
        }.map { date in
            return API.createURL(for: date)
        }.flatMap { (url) in
            return API.createPublisher(url: url)
        }.scan([]) { (partialValue, newValue)  in
            return partialValue + [newValue]
        }
            
        .tryMap({ (infos)  in
            infos.sorted { $0.formattedDate > $1.formattedDate }
        })
            .catch { (error)  in
                Just([PhotoInfo]())
        }
        .eraseToAnyPublisher()
        .receive(on: RunLoop.main)
        .assign(to: \.infos, on: self)
        .store(in: &subscriptions)
        
        getMoreData(for: 20)
        
    }
    
    func timeTravel() {
        let TimeDate = Date.randomBetween(start: "1999-01-01", end: Date().dateString(),format: "yyyy-MM-dd")
        let url = URL(string: Constants.baseURL)!
        let fullURL = url.withQuery(["api_key" : Constants.key, "date" : TimeDate])!
        print(TimeDate)
        print(fullURL)
        
        API.createPublisher(url: fullURL)
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] photoInfo in
                    self?.fetchImage(for: photoInfo)
                    self?.infos.append(photoInfo) // Add the new PhotoInfo instance to the infos array.
                })
                .store(in: &subscriptions)
    }
    
    func getMoreData(for times: Int) {
        for _ in 0..<times {
            self.daysFromToday += 1
        }
    }
    
    func fetchImage(for photoInfo: PhotoInfo) {
        guard photoInfo.image == nil, let url = photoInfo.url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("fetch image error: \(error.localizedDescription)")
            } else if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    if let index = self?.infos.firstIndex(where: { $0.id == photoInfo.id }) {
                        self?.infos[index].image = image
                    }
                }
            }
        }
        task.resume()
    }

    
}
