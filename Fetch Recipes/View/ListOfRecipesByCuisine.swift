import SwiftUI

struct ItemsByCuisine: View {
    @StateObject private var viewModel = RecipeViewModel()
    // organizing an array of Recipe objects into a dictionary where key is cusine and
    //value is an array of recipes
    var groupedRecipes: [String: [Recipe]] {
        Dictionary(grouping: viewModel.recipes, by: { $0.cuisine ?? "" })
    }
   
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            List {
                ForEach(groupedRecipes.keys.sorted(), id: \.self) { cuisine in
                    Section(header: Text(cuisine).font(.title3.bold())) {
                        ForEach(groupedRecipes[cuisine] ?? [], id: \.self) { recipe in
                            HStack(spacing: 17){
                                VStack(alignment: .leading, spacing: 8){
                                    Text(recipe.name ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                    Text("\(recipe.name ?? "") is the art of preparing and enjoying food, shaped by culture, geography, and tradition.")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                    HStack(spacing: 18){
                                        Text("Buy 1, Get 1 Free")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14))
                                            .fontWeight(.bold)
                                            
                                        Text("$8.99")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14))
                                    }
                                    
                                }
                                
                                Spacer()
                                
                                AsyncImage(url: URL(string: recipe.photo_url_small ?? "")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 130, height: 130)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                            }
                        }
                    }
                }
              
            }
            .onAppear{
                viewModel.loadRecipes()
            }
            .refreshable{
                viewModel.loadRecipes()
            }
        }
        
    }
}

#Preview {
    ItemsByCuisine()
}
