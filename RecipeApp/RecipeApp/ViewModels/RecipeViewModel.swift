import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []

    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }

    func updateRecipe(recipe: Recipe) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index] = recipe
        }
    }

    func deleteRecipe(recipe: Recipe) {
        recipes.removeAll { $0.id == recipe.id }
    }
}
