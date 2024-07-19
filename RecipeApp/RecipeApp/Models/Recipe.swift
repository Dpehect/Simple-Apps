import Foundation
import UIKit

struct Recipe: Identifiable {
    let id: UUID
    var title: String
    var ingredients: String
    var instructions: String
    var image: UIImage?

    init(id: UUID = UUID(), title: String, ingredients: String, instructions: String, image: UIImage? = nil) {
        self.id = id
        self.title = title
        self.ingredients = ingredients
        self.instructions = instructions
        self.image = image
    }
}
