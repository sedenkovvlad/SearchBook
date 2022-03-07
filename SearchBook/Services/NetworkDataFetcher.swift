//
//  NetworkDataFetcher.swift
//  SearchBook
//
//  Created by Владислав Седенков on 07.03.2022.
//

import Foundation

protocol DataFetcher {
    func fetchBook(search: String, response: @escaping (BookResponse?) -> Void)
}


struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func fetchBook(search: String, response: @escaping (BookResponse?) -> Void) {
        networking.request(search: search) { data, error in
            if let error = error {
                print(  print("Error received requesting data: \(error.localizedDescription)"))
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: BookResponse.self, from: data)
            response(decoded)
            
        }
    }
    
    private func decodeJSON<T:Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else {
            return nil
        }
        return response
    }
}


