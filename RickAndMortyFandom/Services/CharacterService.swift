//
//  CharacterService.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

import Foundation

actor CharacterService {
    
    @Published var characters: [Character] = []
    @Published var info: Info? = nil
    @Published var error: Error?
    init() {
        Task {
            try? await getData()
        }
    }
    
    func getData() async throws {
        
        let url: URL?
       
        do {
            if try getURL() != nil {
                 url = try getURL()
            } else {
                return
            }
            
            let (data, response) = try await URLSession.shared.data(from: url ?? URL(string: "")! )
                        
            guard let fetchedData = try? JSONDecoder().decode(CharacterResponse.self, from: try NetworkManager.handleResponse(data: data, response: response)) else {
                throw NetworkingError.invalidData
            }
            info = fetchedData.info
            characters.append(contentsOf: fetchedData.results ?? [])
        } catch {
            self.error = error
        }
    }
    
    private func getURL() throws -> URL? {
        if info == nil {
            guard let url = URL(string: APIRoutes.instance.baseUrl + APIRoutes.instance.characterEndpoint) else {
                throw NetworkingError.invalidURL
            }
            return url
        } else if info?.next == nil {
            return nil
        } else {
            guard let url = URL(string: info?.next ?? "") else {
                throw NetworkingError.invalidURL
            }
            return url
        }
    }
    
    func clearData() async {
        characters.removeAll()
        info = nil
        error = nil
        
        try? await getData()
    }
    
}
