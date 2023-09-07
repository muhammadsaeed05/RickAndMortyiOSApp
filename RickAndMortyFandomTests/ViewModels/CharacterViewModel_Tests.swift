//
//  CharacterDataService_Tests.swift
//  RickAndMortyFandomTests
//
//  Created by Muhammad Saeed on 29/08/2023.
//

import XCTest

final class CharacterViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CharacterDataService_getData_shouldReturnCharacterResponse() async throws {
        // Given
        let dataService = MockCharacterDataService()
        
        // When
        let response = try await Task.detached {
            return try await dataService.getData()
        }.value
        
        // Then
        XCTAssertNotNil(response)
    }


}
