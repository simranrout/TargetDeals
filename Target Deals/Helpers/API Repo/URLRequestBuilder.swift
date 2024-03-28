//
//  URLBuilder.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation
import Alamofire

final class URLRequestBuilder {
    func build(_ config: APIConfiguration) -> DataRequest {
        return AF.request(config.api.urlString, method: config.httpMethod, parameters: config.parameters)
    }
}

extension APIConfiguration {
    var httpMethod: HTTPMethod {
        switch api.type {
        case .get: .get
        case .post: .post
        }
    }
}
