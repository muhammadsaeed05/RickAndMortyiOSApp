//
//  PreviewProvider.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 27/08/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() {}
    
    @MainActor let vm = CharacterViewModel()
    
    let character = Character(id: 361, name: "Toxic Rick", status: .dead, species: "Humanoid", type: "Rick's Toxic Side", gender: .male, origin: Location(name: "Alien Spa", url: "https://rickandmortyapi.com/api/location/64"), location: Location(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg", episode: ["https://rickandmortyapi.com/api/episode/27"], url: "https://rickandmortyapi.com/api/character/361", created: "2018-01-10T18:20:41.703Z")
}
