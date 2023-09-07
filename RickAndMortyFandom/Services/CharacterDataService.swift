//
//  CharacterService.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

import Foundation

//actor CharacterDataService: DataService {
//    
//    var info: Info? = nil
//    
//    func getData() async throws -> CharacterResponse? {
//        let url: URL?
//       
//        do {
//            if try getURL() != nil {
//                 url = try getURL()
//            }
//            else {
//                return nil
//            }
//            
//            print(url ?? "")
//            let (data, response) = try await URLSession.shared.data(from: url ?? URL(string: "")! )
//                        
//            guard let fetchedData = try? JSONDecoder().decode(CharacterResponse.self, from: try NetworkManager.handleResponse(data: data, response: response)) else {
//                throw NetworkingError.invalidData
//            }
//            info = fetchedData.info
//            return fetchedData
//        } catch {
//            throw error
//        }
//    }
//    
//    private func getURL() throws -> URL? {
//        if info == nil {
//            guard let url = URL(string: APIRoutes.instance.baseUrl + APIRoutes.instance.characterEndpoint) else {
//                throw NetworkingError.invalidURL
//            }
//            return url
//        } else if info?.next == nil {
//            return nil
//        } else {
//            guard let url = URL(string: info?.next ?? "") else {
//                throw NetworkingError.invalidURL
//            }
//            return url
//        }
//    }
//    
//}
