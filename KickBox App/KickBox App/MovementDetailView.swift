import SwiftUI

struct MovementDetailView: View {
    let movement: Movement
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text(movement.name)
                    .font(.largeTitle)
                    .bold()
                
                Text(movement.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                WebView(url: URL(string: movement.gifURL)!)
                    .frame(height: 300)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .padding()
        }
        .navigationBarTitle("", displayMode: .inline) // Başlığı gizlemek için
    }
}

struct MovementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovementDetailView(movement: Movement(name: "Jab", description: "Öne doğru kısa, hızlı bir yumruk.", gifURL: "https://giphy.com/embed/26tPrcX6EfSj5N0HK", imageName: "jab"))
    }
}
