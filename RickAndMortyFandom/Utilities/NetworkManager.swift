//
//  NetworkManager.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

import Foundation

class NetworkManager {
    
    
    static func handleResponse(data: Data?, response: URLResponse?) throws -> Data{
        guard
            let data = data,
            let response =  response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingError.serverError
        }
        
        return data
    }
}

enum NetworkingError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "[🔥] Bad response from URL"
        case .serverError: return "[😵] There was an error from server"
        case .invalidData: return "[🚨] The data is invalid. Please try again later"
        case .unknown(let error): return "[⚠️] \(error.localizedDescription)"
        }
    }
}
