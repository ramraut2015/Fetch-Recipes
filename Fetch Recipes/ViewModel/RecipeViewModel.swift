
import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var errorMessage: String?

    func loadRecipes() {
        APIManager.shared.fetchedRecipes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recipes):
                    self.recipes = recipes
                case .failure(let error):
                    self.errorMessage = "Failed to load recipes: \(error)"
                }
            }
        }
    }
    var groupedRecipes: [String: [Recipe]] {
        Dictionary(grouping: recipes, by: { $0.cuisine ?? "" })
    }
    
    
}

