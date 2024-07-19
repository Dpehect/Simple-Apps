import SwiftUI

@main
struct RecipeAppApp: App {
    @StateObject private var recipeViewModel = RecipeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModel)
        }
    }
}
