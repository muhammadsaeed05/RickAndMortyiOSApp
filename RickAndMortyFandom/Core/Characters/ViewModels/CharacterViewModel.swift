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
    @Published private(set) var allCharacters: [Character] = [Character]()
    @Published private(set) var info: Info?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published private(set) var viewState: ViewState?
    @Published var hasError: Bool = false
    
    var page: Int = 1
    var totalPages: Int?
    
    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var isFetching: Bool {
        viewState == .fetching
    }

    
    func loadData() async {
        reset()
        
        viewState = .loading
        defer { viewState = .finished }
        
        do {
            let response = try await NetworkingManager.shared.request(endpoint: .characters(page: page), type: CharacterResponse.self)
            
            self.totalPages = response.info?.pages
            self.allCharacters = response.results ?? []
            self.info = response.info
            
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
    
    func loadNextSetOfData() async {
        
        guard page != totalPages else { return }
        
        viewState = .fetching
        defer {
            viewState = .finished
        }
        
        page += 1
        
        do {
            let response = try await NetworkingManager.shared.request(endpoint: .characters(page: page), type: CharacterResponse.self)
            
            self.totalPages = response.info?.pages
            self.allCharacters.append(contentsOf: response.results ?? [])
            self.info = response.info
            
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
    
    
    
}

extension CharacterViewModel {
    enum ViewState {
        case loading
        case fetching
        case finished
    }
}

private extension CharacterViewModel {
    func reset() {
        if viewState == .finished {
            allCharacters.removeAll()
            viewState = nil
            page = 1
            totalPages = nil
        }
    }
}
