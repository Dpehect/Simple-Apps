import SwiftUI

struct ContentView: View {
    let movements = [
        Movement(name: "Jab", description: "Öne doğru kısa, hızlı bir yumruk.", gifURL: "https://giphy.com/embed/26tPrcX6EfSj5N0HK", imageName: "jab"),
        Movement(name: "Cross", description: "Arkadaki el ile güçlü bir yumruk.", gifURL: "https://giphy.com/embed/dAknWZ0gEXL4A", imageName: "cross"),
        Movement(name: "Hook", description: "Yan tarafa doğru kısa, dairesel bir yumruk.", gifURL: "https://giphy.com/embed/97080fI6xE9guW3z53", imageName: "hook"),
        Movement(name: "Uppercut", description: "Aşağıdan yukarıya doğru kısa, güçlü bir yumruk.", gifURL: "https://giphy.com/embed/Xpi86WPdU3obi2f7nz", imageName: "uppercut"),
        Movement(name: "High Kick", description: "Kafa bölgesine doğru atılan 135 derecelik tekme", gifURL: "https://giphy.com/embed/uARtROPPbalvVN9AX3", imageName: "highkick"),
        Movement(name: "Mid Kick", description: "Kemer atılan sertlik olarak en sert tekme türü", gifURL: "https://giphy.com/embed/BKqoHeHlbcRvW", imageName: "midkick"),
        Movement(name: "Low Kick", description: "Kemeraltı atılan sertlik olarak değil serilik olarak önem arz eden tekme türü", gifURL: "https://giphy.com/embed/l41lPSrnjr3WIByww", imageName: "lowkick"),
    ]
    
    var body: some View {
        NavigationView {
            List(movements) { movement in
                NavigationLink(destination: MovementDetailView(movement: movement)) {
                    VStack {
                        Image(movement.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(10)
                        Text(movement.name)
                            .font(.headline)
                            .padding([.top, .bottom], 10)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .navigationTitle("Kickbox Movements")
            .background(Color.gray.opacity(0.1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
