import Foundation

struct Movement: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let gifURL: String
    let imageName: String // Resim adı
}
