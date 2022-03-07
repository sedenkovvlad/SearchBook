//
//  NetworkService.swift
//  SearchBook
//
//  Created by Владислав Седенков on 07.03.2022.
//

import Foundation

protocol Networking {
    func request(search: String , completion: @escaping (Data?, Error?) -> Void)
}


final class NetworkService: Networking {
    
    func request(search: String , completion: @escaping (Data?, Error?) -> Void) {
        let params = [API.params: search]
        guard let url = self.url(params: params) else { return }
        let request = URLRequest(url: url)
        let task = createDataTast(from: request, completion: completion)
        task.resume()
    }
   
    
    private func createDataTast(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, _ , error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    private func url(params: [String: String]) -> URL? {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.books
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        guard let url = components.url else { return nil }
        return url
    }
}
