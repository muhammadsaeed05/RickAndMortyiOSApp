//
//  CharacterViewModel.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 26/08/2023.
//

import Foundation
import AsyncAlgorithms

@MainActor
class CharacterViewModel: ObservableObject {
    @Published var allCharacters: [Character] = [Character]()
    @Published var info: Info?
    @Published var error: Error?
    
    private let characterService = CharacterService()
    
    init() {
        addSubscriber()
    }
    
    func loadData() async {
        try? await characterService.getData()
    }
    
    func reloadData() async {
        await characterService.clearData()
    }
    
    private func addSubscriber() {
        Task {
            for try await (characters, error) in await combineLatest(characterService.$characters.values, characterService.$error.values) {
                await MainActor.run(body: {
                    self.allCharacters = characters
                    self.error = error
                })
            }

        }
    }
    
}
