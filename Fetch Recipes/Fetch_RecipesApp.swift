//
//  Fetch_RecipesApp.swift
//  Fetch Recipes
//
//  Created by rina yadav on 6/1/25.
//

import SwiftUI

@main
struct Fetch_RecipesApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(selectedOption:
                    Recipe(
                    id: UUID(),
                    cuisine: "American",
                    name: "Pasta",
                    photo_url_large: nil,
                    photo_url_small: nil,
                    source_url: nil,
                    uuid: "abc-123",
                    youtube_url: nil
                )
            )
        }
    }
}
