//
//  ApiType.swift
//  Target Deals
//
//  Created by Simran Rout on 27/03/24.
//

import Foundation

protocol APIConfiguration {
    var api: API { get }
    var headers: [String: String] { get }
    var parameters: [String: Any] { get }
}

/// default implementation: `By Default headers and parameter is empty`
extension APIConfiguration {
    var headers: [String: String] {
        [:]
    }
    
    var parameters: [String: Any] {
        [:]
    }
}

enum API {
    case itemList
    case itemDetails(pageId: Int)
    
    var type: MethodType {
        switch self {
        case .itemList, .itemDetails:
            return .get
        }
    }
    
    var scheme: Scheme {
        switch self {
        case .itemList, .itemDetails:
            return .secure
        }
    }
    
    var path: Path {
        switch self {
        case .itemList, .itemDetails:
            return .mobileCaseStudy
        }
    }
    
    var endPoint: String {
        switch self {
        case .itemList:
            return "v1/deals"
        case .itemDetails(pageId: let pageId):
            return "v1/deals/\(pageId)"
        }
    }
    
    var urlString: String {
        return "\(scheme.rawValue)://\(domain)/\(path.rawValue)/\(endPoint)"
    }
}

/// URL breakdown
extension API {
    var domain: String {
        "api.target.com"
    }
    
    enum Scheme: String {
        case secure = "https"
        case regular = "http"
    }
    
    enum Path: String {
        case mobileCaseStudy = "mobile_case_study_deals"
    }
    
    enum MethodType {
        case get
        case post
    }
}



