
import Foundation
import SwiftUI

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}
struct Recipe: Codable, Identifiable, Hashable {
    var id: UUID? = UUID()
    var cuisine: String?
    var name: String?
    var photo_url_large: String?
    var photo_url_small: String?
    var source_url: String?
    var uuid: String?
    var youtube_url: String?
}

