//
//  DataService.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 29/08/2023.
//

import Foundation

protocol DataService {
    func getData() async throws -> CharacterResponse?
}
