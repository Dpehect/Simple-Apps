import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let image = recipe.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                }
                Text("Ingredients")
                    .font(.headline)
                Text(recipe.ingredients)
                Text("Instructions")
                    .font(.headline)
                Text(recipe.instructions)
                Spacer()
            }
            .padding()
        }
        .navigationTitle(recipe.title)
        .navigationBarItems(trailing: NavigationLink("Edit", destination: NavigationView { RecipeFormView(recipe: recipe) }))
    }
}
