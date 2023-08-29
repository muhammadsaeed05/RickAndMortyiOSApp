//
//  CharacterModel.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

// MARK: - CharacterResponse
struct CharacterResponse: Codable {
    let info: Info?
    let results: [Character]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - Result
struct Character: Codable, Identifiable {
    let id: Int?
    let name: String?
    let status: Status?
    let species, type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case genderless = "Genderless"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
