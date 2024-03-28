//
//  NetworkCallManager.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation
import Alamofire

protocol NetworkLayerProtocol {
    associatedtype T
    func request(apiConfig: APIConfiguration, completionHandler: @escaping (Result<T, Error>) -> Void)
}

final class NetworkLayerManager<T: Decodable>: NetworkLayerProtocol {
    func request(apiConfig: APIConfiguration, completionHandler: @escaping (Result<T, Error>) -> Void) {
        let request = URLRequestBuilder().build(apiConfig)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        request.responseDecodable(of: T.self, queue: .global(), decoder: jsonDecoder) { response in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
