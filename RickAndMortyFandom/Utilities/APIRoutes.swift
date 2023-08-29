//
//  APIRoutes.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

import Foundation

class APIRoutes {
    
    static let instance = APIRoutes()
    
    private init() {}
    
    let baseUrl = "https://rickandmortyapi.com/api/"
    let characterEndpoint = "character"
    let locationEndpoint = "location"
    let episodeEnpoint = "episode"
    
}
