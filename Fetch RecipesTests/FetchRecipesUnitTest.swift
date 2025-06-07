//
//  FetchRecipesUnitTest.swift
//  Fetch RecipesTests
//
//  Created by rina yadav on 6/5/25.
//

import XCTest
import Testing
@testable import Fetch_Recipes

struct FetchRecipesUnitTest {

    @Test func testFetchProductAsyncSuccess() async throws {
        let apiManager = APIManager()
        
        apiManager.fetchedRecipes { result in
            switch result {
            case .success(let recipes):
                XCTAssertFalse(recipes.isEmpty)
            case .failure(let error):
                XCTFail("Expected success but got failure: \(error)")
            }
        }
    }

}
