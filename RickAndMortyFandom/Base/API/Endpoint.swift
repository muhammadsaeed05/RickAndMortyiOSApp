//
//  Endpoint.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 06/09/2023.
//

import Foundation

enum Endpoint {
    case characters(page: Int)
    case locations(page: Int)
    case episodes(page: Int)
}

extension Endpoint {
    enum MethodType {
        case GET
    }
}

extension Endpoint {
    var host: String { "rickandmortyapi.com" }
    
    var path: String {
        switch self {
        case .characters:
            return "/api/character"
        case .episodes:
            return "/api/episode"
        case .locations:
            return "/api/location"
        }
    }
    
    var methodType: MethodType {
        switch self {
        case .characters,
                .episodes,
                .locations:
            return .GET
            
        }
    }
    
    var queryItems: [String: String]? {
        switch self {
        case .characters(let page),
                .episodes(let page),
                .locations(let page):
            return ["page": "\(page)"]
        }
    }
}

extension Endpoint {
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        var requestQueryItems = [URLQueryItem]()
        
        queryItems?.forEach { item in
            requestQueryItems.append(URLQueryItem(name: item.key, value: item.value))
        }
        urlComponents.queryItems = requestQueryItems
        
        return urlComponents.url
    }
    
}
