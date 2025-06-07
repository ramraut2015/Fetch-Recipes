

import UIKit




enum DataError: Error{
    case invalidResponse
    case invalidData
    case network(Error?)
}
typealias Handler = (Result<[Recipe], DataError>) -> Void

class APIManager: ObservableObject{
    @Published var recipes: [Recipe] = []
    static let shared = APIManager()
    
    func fetchedRecipes(completion: @escaping Handler){
        guard let url = URL(string: Constant.API.recipesURL) else{return }
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil  else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let response = try JSONDecoder().decode(RecipeResponse.self, from: data)
                DispatchQueue.main.async{
                    self.recipes = response.recipes
                    completion(.success(response.recipes))
                }
            }catch{
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}
