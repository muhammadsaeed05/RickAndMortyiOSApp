//
//  MockCharacterService.swift
//  RickAndMortyFandomTests
//
//  Created by Muhammad Saeed on 29/08/2023.
//

import Foundation
@testable import RickAndMortyFandom

actor MockCharacterDataService: DataService {
    @Published var info: Info? = nil

    
    func getData() async throws -> RickAndMortyFandom.CharacterResponse? {
        var characters: [Character] = []
        
        try? await Task.sleep(for: .seconds(2))

        let random = Int.random(in: 1..<50)
        
        for _ in 0..<random {
            let character = Character(id: Int.random(in: 100..<1000), name: UUID().uuidString, status: .alive, species: UUID().uuidString, type: UUID().uuidString, gender: .male, origin: Location(name: UUID().uuidString, url: UUID().uuidString), location: Location(name: UUID().uuidString, url: UUID().uuidString), image: UUID().uuidString, episode: [UUID().uuidString], url: UUID().uuidString, created: UUID().uuidString)
            characters.append(character)
        }
        var info = Info(count: Int.random(in: 100..<200), pages: Int.random(in: 100..<200), next: UUID().uuidString, prev: UUID().uuidString)
        
        return CharacterResponse(info: info, results: characters)
    }
}
