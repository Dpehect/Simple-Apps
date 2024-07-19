import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @State private var showingAddRecipe = false

    var body: some View {
        NavigationView {
            List {
                ForEach(recipeViewModel.recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        Text(recipe.title)
                    }
                }
                .onDelete(perform: deleteRecipe)
            }
            .navigationTitle("Recipes")
            .navigationBarItems(trailing: Button(action: {
                showingAddRecipe = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddRecipe) {
                NavigationView {
                    RecipeFormView()
                }
            }
        }
    }

    func deleteRecipe(at offsets: IndexSet) {
        for index in offsets {
            let recipe = recipeViewModel.recipes[index]
            recipeViewModel.deleteRecipe(recipe: recipe)
        }
    }
}
