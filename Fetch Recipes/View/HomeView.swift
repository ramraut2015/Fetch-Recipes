
import SwiftUI

struct HomeView: View {
    @State var selectedOption: Recipe
    @StateObject private var viewModel = RecipeViewModel()
    var body: some View {
        VStack{
            HStack(spacing: 17){
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                }
                Text("Fetch Recipes")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }
                

            }
            .padding(.horizontal)
            .foregroundColor(.black)
            HorizontalCuisineMenu(selectedOption: $selectedOption)
                .padding([.top, .horizontal])
                .overlay(
                    Divider()
                        .padding(.horizontal, -15)
                        ,alignment: .bottom
                )
            
            ScrollViewReader { proxy in
                VStack {
                    ListOfRecipesByCuisine()
                }
                .onChange(of: selectedOption.cuisine) {
                    if let cuisine = selectedOption.cuisine {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation {
                                    proxy.scrollTo(cuisine, anchor: .top)
                                }
                            }
                        //proxy.scrollTo(cuisine, anchor: .top)
                    }
                }
            }
           
        }
    }
}

#Preview {
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
