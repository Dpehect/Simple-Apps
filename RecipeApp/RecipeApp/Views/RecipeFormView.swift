import SwiftUI

struct RecipeFormView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @Environment(\.presentationMode) var presentationMode

    @State private var title: String = ""
    @State private var ingredients: String = ""
    @State private var instructions: String = ""
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false

    var recipe: Recipe?

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Title", text: $title)
            }
            Section(header: Text("Ingredients")) {
                TextField("Ingredients", text: $ingredients)
            }
            Section(header: Text("Instructions")) {
                TextField("Instructions", text: $instructions)
            }
            Section(header: Text("Image")) {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
                Button(action: {
                    showingImagePicker = true
                }) {
                    Text("Select Image")
                }
            }
        }
        .navigationBarItems(leading: Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }, trailing: Button("Save") {
            saveRecipe()
            presentationMode.wrappedValue.dismiss()
        })
        .onAppear {
            if let recipe = recipe {
                title = recipe.title
                ingredients = recipe.ingredients
                instructions = recipe.instructions
                image = recipe.image
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(selectedImage: $image)
        }
    }

    func saveRecipe() {
        let newRecipe = Recipe(title: title, ingredients: ingredients, instructions: instructions, image: image)
        if let recipe = recipe {
            recipeViewModel.updateRecipe(recipe: newRecipe)
        } else {
            recipeViewModel.addRecipe(recipe: newRecipe)
        }
    }
}
