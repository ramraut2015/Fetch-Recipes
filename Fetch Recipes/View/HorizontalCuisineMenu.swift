
import SwiftUI

struct HorizontalCuisineMenu: View {
    @StateObject var viewModel = RecipeViewModel()
    @Binding var selectedOption: Recipe
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                ForEach(viewModel.groupedRecipes.keys.sorted(), id: \.self) { cuisine in
                    VStack{
                        Text(cuisine)
                            .foregroundColor(cuisine == selectedOption.cuisine ? .black : .gray)
                        if selectedOption.cuisine ==  cuisine{
                            Capsule()
                                .fill(.black)
                                .frame(height: 3)
                                .padding(.horizontal, -10)
                        }else{
                            Capsule()
                                .fill(.clear)
                                .frame(height: 3)
                                .padding(.horizontal, -10)
                        }
                    }
                    .onTapGesture {
                        self.selectedOption.cuisine! =  cuisine
                    }
                }
            }
        }
        .onAppear{
            viewModel.loadRecipes()
        }
    }
}

#Preview {
    HorizontalCuisineMenu(selectedOption: .constant(
        Recipe(
            id: UUID(),
            cuisine: "American",
            name: "Banan",
            photo_url_large: nil,
            photo_url_small: nil,
            source_url: nil,
            uuid: "abc-123",
            youtube_url: nil
        )
    ))
}
